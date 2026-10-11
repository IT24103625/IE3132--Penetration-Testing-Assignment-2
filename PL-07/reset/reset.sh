#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHALLENGE_DIR="$SCRIPT_DIR/../challenge"

cp "$SCRIPT_DIR/hospital_traffic.original.pcap" \
   "$CHALLENGE_DIR/hospital_traffic.pcap"

echo "[+] PL-07 challenge reset successfully."
echo "[+] Original PCAP restored."
