# Member 3 - Automated Challenge Tests

## Purpose
This test suite verifies the required files, solver execution, expected flags,
and reset/recovery functionality for PL-03 and PL-07.

## Prerequisites
- Python 3
- Scapy installed for the PL-07 solver

## Run the tests
From the repository root:

    ./tests/run_member3_tests.sh

## Test coverage
- Required challenge files exist and are non-empty.
- PL-03 solver returns `PULSE{attacker_note_decoded}`.
- PL-03 reset restores the original ciphertext.
- PL-03 remains solvable after reset.
- PL-07 solver returns `PULSE{exfiltration_confirmed}`.
- PL-07 reset restores the original PCAP.
- PL-07 remains solvable after reset.

The test runner prints a summary and saves a timestamped log in `test-results/`.

## Latest recorded result
The test run on 9 October 2026 completed with 16 passed and 0 failed.

These tests cover Member 3's two challenges; they do not certify the entire CTF platform.
