#!/bin/bash

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RESULTS_DIR="$ROOT/test-results"
mkdir -p "$RESULTS_DIR"

LOG="$RESULTS_DIR/member3-test-$(date +%Y%m%d-%H%M%S).log"
BACKUP_DIR="$(mktemp -d)"

PASS=0
FAIL=0
SAFE_TO_KEEP=0

# Preserve the current challenge files in case a test fails.
cp "$ROOT/PL-03/challenge/ciphertext.txt" "$BACKUP_DIR/ciphertext.txt"
cp "$ROOT/PL-07/challenge/hospital_traffic.pcap" "$BACKUP_DIR/hospital_traffic.pcap"

cleanup() {
    if [ "$SAFE_TO_KEEP" -ne 1 ]; then
        cp "$BACKUP_DIR/ciphertext.txt" "$ROOT/PL-03/challenge/ciphertext.txt"
        cp "$BACKUP_DIR/hospital_traffic.pcap" "$ROOT/PL-07/challenge/hospital_traffic.pcap"
        echo "[!] Original working challenge files restored after an incomplete test run."
    fi
    rm -rf "$BACKUP_DIR"
}
trap cleanup EXIT

exec > >(tee "$LOG") 2>&1

pass() {
    echo "[PASS] $1"
    PASS=$((PASS + 1))
}

fail() {
    echo "[FAIL] $1"
    FAIL=$((FAIL + 1))
}

run_solver_test() {
    local name="$1"
    local solver="$2"
    local expected_flag="$3"
    local output

    echo
    echo "Running: $name"

    if output=$(python3 "$solver" 2>&1); then
        printf '%s\n' "$output"

        if grep -Fq -- "$expected_flag" <<< "$output"; then
            pass "$name solver returns the expected flag"
        else
            fail "$name solver did not return the expected flag"
        fi
    else
        printf '%s\n' "$output"
        fail "$name solver execution"
    fi
}

echo "=========================================="
echo " OPERATION PULSELOCK - MEMBER 3 TESTS"
echo " Date: $(date)"
echo "=========================================="

# Check required challenge files.
for file in \
    "PL-03/challenge/README.md" \
    "PL-03/challenge/ciphertext.txt" \
    "PL-03/reset/ciphertext.original.txt" \
    "PL-03/solver/solve.py" \
    "PL-07/challenge/README.md" \
    "PL-07/challenge/hospital_traffic.pcap" \
    "PL-07/reset/hospital_traffic.original.pcap" \
    "PL-07/solver/solve.py"
do
    if [ -s "$ROOT/$file" ]; then
        pass "Required file exists: $file"
    else
        fail "Missing or empty file: $file"
    fi
done

# Test PL-03 solver before reset.
run_solver_test \
    "PL-03" \
    "$ROOT/PL-03/solver/solve.py" \
    "PULSE{attacker_note_decoded}"

# Deliberately alter the challenge file to verify that reset restores it.
echo "RESET-TEST-MARKER" > "$ROOT/PL-03/challenge/ciphertext.txt"

if bash "$ROOT/PL-03/reset/reset.sh"; then
    pass "PL-03 reset script executes"
else
    fail "PL-03 reset script execution"
fi

if cmp -s \
    "$ROOT/PL-03/reset/ciphertext.original.txt" \
    "$ROOT/PL-03/challenge/ciphertext.txt"; then
    pass "PL-03 reset restores the original ciphertext"
else
    fail "PL-03 reset does not restore the original ciphertext"
fi

# Verify the challenge remains solvable after reset.
run_solver_test \
    "PL-03 after reset" \
    "$ROOT/PL-03/solver/solve.py" \
    "PULSE{attacker_note_decoded}"

# Test PL-07 solver before reset.
run_solver_test \
    "PL-07" \
    "$ROOT/PL-07/solver/solve.py" \
    "PULSE{exfiltration_confirmed}"

# Deliberately alter the PCAP to verify that reset restores it.
printf 'RESET-TEST-MARKER\n' > "$ROOT/PL-07/challenge/hospital_traffic.pcap"

if bash "$ROOT/PL-07/reset/reset.sh"; then
    pass "PL-07 reset script executes"
else
    fail "PL-07 reset script execution"
fi

if cmp -s \
    "$ROOT/PL-07/reset/hospital_traffic.original.pcap" \
    "$ROOT/PL-07/challenge/hospital_traffic.pcap"; then
    pass "PL-07 reset restores the original PCAP"
else
    fail "PL-07 reset does not restore the original PCAP"
fi

# Verify the challenge remains solvable after reset.
run_solver_test \
    "PL-07 after reset" \
    "$ROOT/PL-07/solver/solve.py" \
    "PULSE{exfiltration_confirmed}"

echo
echo "=========================================="
echo " TEST SUMMARY"
echo " Passed: $PASS"
echo " Failed: $FAIL"
echo " Log: $LOG"
echo "=========================================="

if [ "$FAIL" -eq 0 ]; then
    SAFE_TO_KEEP=1
    echo "RESULT: ALL TESTS PASSED"
    exit 0
else
    echo "RESULT: SOME TESTS FAILED"
    exit 1
fi
