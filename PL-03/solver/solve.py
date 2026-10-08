import base64
import codecs
from pathlib import Path


KEY = "PULSELOCK"


def vigenere_decrypt(text, key):
    result = []
    key = key.upper()
    key_index = 0

    for char in text:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shift = ord(key[key_index % len(key)]) - ord('A')

            decrypted = chr(
                (ord(char) - base - shift) % 26 + base
            )

            result.append(decrypted)
            key_index += 1
        else:
            result.append(char)

    return ''.join(result)


# Locate the challenge ciphertext
script_dir = Path(__file__).parent
ciphertext_file = script_dir.parent / "challenge" / "ciphertext.txt"

ciphertext = ciphertext_file.read_text(encoding="utf-8").strip()

print("[+] Ciphertext loaded")
print("[+] Layer 1: Base64 decoding")

base64_decoded = base64.b64decode(ciphertext).decode("utf-8")

print("[+] Layer 2: ROT13 decoding")

rot13_decoded = codecs.decode(base64_decoded, "rot_13")

print("[+] Layer 3: Vigenere decryption")

plaintext = vigenere_decrypt(rot13_decoded, KEY)

print()
print("=" * 60)
print("DECODED ATTACKER MESSAGE")
print("=" * 60)
print(plaintext)
print("=" * 60)

if "PULSE{" in plaintext:
    print("[+] FLAG FOUND")
else:
    print("[-] Flag not found")
