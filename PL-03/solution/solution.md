# PL-03 Solution – Encrypted Attacker Note

## Intended Solution Path

The recovered ciphertext contains three layers.

### Layer 1 – Base64

The ciphertext consists of characters commonly used in Base64 encoding and ends with Base64 padding.

Decode the ciphertext using Base64.

### Layer 2 – ROT13

The resulting text is still unreadable but contains alphabetic characters that can be transformed using ROT13.

Apply ROT13.

### Layer 3 – Vigenère

The resulting text is still encrypted.

Use the earlier investigation keyword:

`PULSELOCK`

Apply Vigenère decryption using `PULSELOCK` as the key.

## Recovered Message

The final plaintext is:

PULSELOCK INVESTIGATION LOG

The attacker accessed the research portal using a stolen maintenance credential.

The next entry point is the telemetry gateway.

Recover the flag from this note:

`PULSE{attacker_note_decoded}`

## Flag

`PULSE{attacker_note_decoded}`

## Expected Tools

- CyberChef
- Base64 decoder
- ROT13
- Vigenère cipher
- Custom Python solver
