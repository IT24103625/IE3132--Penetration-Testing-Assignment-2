from scapy.all import rdpcap, IP, TCP, Raw
from collections import defaultdict
from datetime import datetime
from pathlib import Path
import re


PCAP_FILE = Path(__file__).parent.parent / "challenge" / "hospital_traffic.pcap"
HOSPITAL_NETWORK = "10.10.20."


def is_hospital_host(ip):
    return ip.startswith(HOSPITAL_NETWORK)


def connection_key(src, dst, sport, dport):
    endpoint_a = (src, sport)
    endpoint_b = (dst, dport)

    return tuple(sorted([endpoint_a, endpoint_b]))


def format_time(timestamp):
    return datetime.fromtimestamp(timestamp).strftime(
        "%Y-%m-%d %H:%M:%S"
    )


def main():

    print("=" * 70)
    print("PL-07 SOLVER - THE EXFILTRATION TRAIL")
    print("=" * 70)

    if not PCAP_FILE.exists():
        print(f"[-] PCAP not found: {PCAP_FILE}")
        return

    print(f"[+] Loading PCAP: {PCAP_FILE}")

    packets = rdpcap(str(PCAP_FILE))

    print(f"[+] Packets loaded: {len(packets)}")
    print()

    # Group TCP packets into bidirectional conversations.
    conversations = defaultdict(list)

    for packet in packets:

        if IP not in packet or TCP not in packet:
            continue

        src = packet[IP].src
        dst = packet[IP].dst
        sport = packet[TCP].sport
        dport = packet[TCP].dport

        key = connection_key(src, dst, sport, dport)

        conversations[key].append(packet)

    print(
        f"[+] Bidirectional TCP conversations identified: "
        f"{len(conversations)}"
    )
    print()

    suspicious = []

    print("[+] Reviewing TCP conversations...")
    print()

    for key, stream_packets in conversations.items():

        hospital_to_remote = False
        payload_parts = []

        for packet in stream_packets:

            if IP not in packet or TCP not in packet:
                continue

            src = packet[IP].src

            if is_hospital_host(src):

                hospital_to_remote = True

            if Raw in packet:
                payload_parts.append(
                    bytes(packet[Raw].load)
                )

        if not hospital_to_remote:
            continue

        payload = b"".join(payload_parts)

        text_payload = payload.decode(
            "utf-8",
            errors="ignore"
        )

        if "POST /upload" in text_payload:

            suspicious.append(
                (key, stream_packets, text_payload)
            )

    if not suspicious:

        print("[-] No suspicious upload connection found.")
        return

    print(
        f"[+] Suspicious upload connection(s): "
        f"{len(suspicious)}"
    )
    print()

    for number, (key, stream_packets, payload) in enumerate(
        suspicious,
        start=1
    ):

        print("-" * 70)
        print(f"SUSPICIOUS CONNECTION #{number}")
        print("-" * 70)

        endpoints = sorted(key)

        print(
            f"Endpoint 1 : "
            f"{endpoints[0][0]}:{endpoints[0][1]}"
        )

        print(
            f"Endpoint 2 : "
            f"{endpoints[1][0]}:{endpoints[1][1]}"
        )

        first_time = min(
            float(packet.time)
            for packet in stream_packets
        )

        last_time = max(
            float(packet.time)
            for packet in stream_packets
        )

        print(
            f"Timeframe  : "
            f"{format_time(first_time)} → "
            f"{format_time(last_time)}"
        )

        print(
            f"Packets    : "
            f"{len(stream_packets)}"
        )

        print()
        print("[+] Reconstructed application payload:")
        print()

        print(payload)

        print()

        flag_match = re.search(
            r"PULSE\{[^}]+\}",
            payload
        )

        if flag_match:

            print("=" * 70)
            print(
                f"[+] FLAG FOUND: "
                f"{flag_match.group(0)}"
            )
            print("=" * 70)

        else:

            print("[-] No PULSE flag found.")


if __name__ == "__main__":
    main()
