# PL-03 – Encrypted Attacker Note

## Scenario

During the investigation, analysts recovered a suspicious note left behind by the attacker.

The note does not directly reveal its contents. It appears to have been processed through multiple encoding and cipher layers.

Your task is to recover the original attacker message.

## Objective

Identify the transformations applied to the recovered ciphertext and decode them in the correct order.

The final decoded message contains a clue required to continue the investigation.

## Difficulty

Moderate

## Domain

Cryptography

## Provided File

- `ciphertext.txt`

## Recommended Tools

- CyberChef
- Base64 decoder
- ROT13/Caesar cipher tools
- Vigenère cipher tools
- Basic pattern analysis

## Rules

- Do not modify the original `ciphertext.txt`.
- Determine the decoding order based on the characteristics of the ciphertext.
- The challenge should be solved using analysis rather than guessing the final flag.

## Success Condition

Recover the complete attacker message and obtain the challenge flag.

Flag format:

`PULSE{...}`
