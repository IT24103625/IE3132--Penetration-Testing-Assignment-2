#!/usr/bin/env python3

EXPECTED_FLAG = "PULSE{public_trace_found}"

def check_flag(submitted_flag):
    return submitted_flag.strip() == EXPECTED_FLAG

def main():
    submitted_flag = input("Enter the PL1 flag: ")

    if check_flag(submitted_flag):
        print("[+] Correct flag! PL1 challenge solved.")
    else:
        print("[-] Incorrect flag. Review the supplied evidence.")

if __name__ == "__main__":
    main()
