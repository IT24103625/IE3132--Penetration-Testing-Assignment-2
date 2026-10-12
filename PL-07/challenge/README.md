# PL-07 – The Exfiltration Trail

## Scenario

The hospital security team has recovered a packet capture from a workstation used in the research environment.

Most of the traffic appears to be normal hospital activity, but an analyst suspects that the workstation may have made an unauthorized outbound transfer.

Your task is to investigate the packet capture and determine whether sensitive research data was exfiltrated.

---

## Objective

Analyze the supplied PCAP and determine:

1. Which workstation generated the suspicious outbound traffic.
2. The remote destination involved in the suspicious communication.
3. The protocol and port used for the transfer.
4. The approximate timeframe of the suspicious activity.
5. What information was transferred.
6. Whether the transfer was successfully completed.
7. Recover the flag contained in the exfiltrated data.

---

## Evidence

The packet capture is:

`hospital_traffic.pcap`

The capture contains a mixture of:

- DNS activity
- Internal hospital web traffic
- Normal encrypted-traffic-like activity
- A suspicious outbound connection

Not all traffic in the capture is malicious.

---

## Recommended Tools

You may use:

- Wireshark
- TShark
- tcpdump
- Any other standard packet-analysis tools

Useful Wireshark features include:

- Statistics → Conversations
- Display filters
- TCP stream identification
- Follow → TCP Stream
- Packet timestamps
- Packet details

---

## Investigation Guidance

Start by examining the overall traffic and its timeline.

Pay particular attention to the period around **22:47**.

Identify unusual outbound communication and investigate the associated TCP conversation.

You should reconstruct the communication rather than relying on a single packet.

---

## Rules

- Do not modify the supplied PCAP.
- Do not use information from the solution files.
- Do not rely on hidden files or unintended shortcuts.
- The intended solution requires packet analysis.
- The flag must be recovered from the captured traffic.

---

## Success Condition

The challenge is solved when you recover the flag from the suspicious network communication and can explain:

- the source workstation,
- the remote destination,
- the protocol,
- the timeframe,
- and the exfiltrated information.
