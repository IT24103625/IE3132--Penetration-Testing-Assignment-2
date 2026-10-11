#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHALLENGE_DIR="$SCRIPT_DIR/../challenge"

cp "$SCRIPT_DIR/ciphertext.original.txt" "$CHALLENGE_DIR/ciphertext.txt"

echo "[+] PL-03 challenge reset successfully."
echo "[+] Original ciphertext restored."
