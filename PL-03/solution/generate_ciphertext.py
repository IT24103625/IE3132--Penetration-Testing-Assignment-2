
import base64
import codecs
from pathlib import Path

PLAINTEXT = """PULSELOCK INVESTIGATION LOG
The attacker accessed the research portal using a stolen maintenance credential.
The next entry point is the telemetry gateway.
Recover the flag from this note:
PULSE{attacker_note_decoded}"""

KEY = "PULSELOCK"


def vigenere_encrypt(text, key):
    result = []
    key = key.upper()
    key_index = 0

    for char in text:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shift = ord(key[key_index % len(key)]) - ord('A')

            encrypted = chr(
                (ord(char) - base + shift) % 26 + base
            )

            result.append(encrypted)
            key_index += 1
        else:
            result.append(char)

    return ''.join(result)


# Layer 1: Vigenère
encrypted = vigenere_encrypt(PLAINTEXT, KEY)

# Layer 2: ROT13
rot13_text = codecs.encode(encrypted, "rot_13")

# Layer 3: Base64
ciphertext = base64.b64encode(
    rot13_text.encode("utf-8")
).decode("ascii")


# Save ciphertext in the challenge directory
output_file = Path(__file__).parent.parent / "challenge" / "ciphertext.txt"

output_file.write_text(ciphertext, encoding="utf-8")

print("Ciphertext generated successfully.")
print(f"Saved to: {output_file}")
print()
print(ciphertext)
