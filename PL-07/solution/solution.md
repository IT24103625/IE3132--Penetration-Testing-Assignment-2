# PL-07 – Solution: The Exfiltration Trail

## Challenge Overview

The supplied PCAP contains normal hospital traffic and one suspicious outbound TCP connection.

The intended solution is to use the forensic timeframe from the previous investigation stage, identify the unusual outbound communication, follow the TCP stream, and recover the exfiltrated data.

---

## Intended Solution Path

### Step 1 – Open the PCAP

Open:

`hospital_traffic.pcap`

using Wireshark or TShark.

Review the packet timestamps and identify activity around the suspicious timeframe.

The suspicious activity occurs approximately between:

`22:47:10 – 22:47:18`

---

### Step 2 – Identify the Suspicious Connection

Inspect the traffic occurring during this timeframe.

The suspicious connection is:

Source:

`10.10.20.45`

Destination:

`185.199.110.153`

Protocol:

`TCP`

Destination port:

`443`

The suspicious connection is TCP stream:

`4`

---

### Step 3 – Inspect the TCP Conversation

In Wireshark, use:

`Follow → TCP Stream`

on the suspicious TCP conversation.

Alternatively, with TShark:

```bash
tshark -r hospital_traffic.pcap -q -z follow,tcp,ascii,4
