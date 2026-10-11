# PL5 Implementation Record

## Assignment
Operation PulseLock — Assignment 2

## Challenge
PL5 — Compromised Linux Host

## Design Reference
Assignment 1 PT document:
- Difficulty: Moderate–Hard
- Points: 300
- Required flag: `PULSE{host_compromise_found}`

## Implemented Components
- `CHALLENGE.md`: player scenario, instructions, evidence list, hints, and recovery steps.
- `evidence/logs/auth.log`: synthetic authentication events.
- `evidence/system/cron.txt`: simulated scheduled-task inventory.
- `evidence/system/services.txt`: simulated service inventory.
- `evidence/system/file_metadata.txt`: simulated protected-file metadata.
- `evidence/files/research_archive.txt`: incident investigation clue.
- `evidence/files/archive.flag`: protected flag copied into the container.
- `container/Dockerfile`: builds the isolated Debian challenge image.
- `container/verify-investigation.sh`: source for the restricted investigation verifier.
- `compose.yaml`: starts the temporary challenge container with a read-only filesystem.
- `check_flag.py`: validates a submitted flag string.
- `solution/SOLUTION.md`: organizer walkthrough and expected answers.

## Flag-Recovery Mechanism
The container runs as the unprivileged `analyst` user. A narrowly scoped sudoers rule permits the user to run only `/usr/local/sbin/verify-investigation` as root. The verifier checks three investigation answers before reading the root-protected flag file.

## Tests Completed
- Docker image builds successfully.
- Correct investigation answers reveal `PULSE{host_compromise_found}`.
- Incorrect investigation answers are rejected.
- The flag file is owned by root with mode `0600`.
- The challenge uses synthetic evidence and does not configure real host services or scheduled tasks.

## Limitations / Integration
- Evidence is simulated text, not collected from a real host.
- The standalone flag validator checks the submitted flag string; it does not assess the investigation process.
- CTFd integration has not yet been tested. Organizers must configure the challenge and expected flag in the shared platform.
- A clean rebuild and final package-content review should be performed before group handover.

## Safety
The challenge is intended to run as an isolated Docker container. Do not mount sensitive host directories or expose privileged host resources to it.
