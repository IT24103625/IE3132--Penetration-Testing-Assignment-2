#!/usr/bin/env python3

EXPECTED_FLAG = "PULSE{host_compromise_found}"

def main():
    submitted = input("Enter the PL5 flag: ").strip()

    if submitted == EXPECTED_FLAG:
        print("Correct flag! PL5 validation passed.")
    else:
        print("Incorrect flag. Review the evidence and try again.")

if __name__ == "__main__":
    main()
