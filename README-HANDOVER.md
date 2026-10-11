# Operation PulseLock — Assignment 2 Handover

## Included Stages

### PL1 — The Public Footprint
- Introductory OSINT and document-metadata investigation.
- Player instructions: `PL1/CHALLENGE.md`
- Evidence: `PL1/site/`
- Organizer validator: `PL1/check_flag.py`
- Implementation notes: `PL1/IMPLEMENTATION.md`
- Expected flag: `PULSE{public_trace_found}`

### PL5 — Compromised Linux Host
- Moderate–Hard Linux and system-security investigation.
- Player instructions: `PL5/CHALLENGE.md`
- Synthetic evidence: `PL5/evidence/`
- Docker setup: `PL5/compose.yaml` and `PL5/container/Dockerfile`
- Recovery helper source: `PL5/container/verify-investigation.sh`
- Organizer solution: `PL5/solution/SOLUTION.md`
- Expected flag: `PULSE{host_compromise_found}`

## Run PL5 Locally

From the `PL5` directory:

    docker compose build
    docker compose run --rm pl5

Inside the container, inspect `/opt/pulselock/evidence/`. After investigating, run:

    sudo /usr/local/sbin/verify-investigation

Enter the three answers supported by the evidence. The flag is shown only when all answers match.

## Testing Status

- PL1 flag validator and PDF metadata checked.
- PL5 Docker image build and Compose configuration checked.
- PL5 correct answers reveal the expected flag.
- PL5 incorrect answers are rejected.
- Shared CTFd integration has not yet been tested.

## Distribution Notes

- Keep organizer solutions, validators, and flag files out of participant downloads.
- `handoff/PL1-player.zip` is the PL1 participant package.
- `handoff/PL1-organizer.zip` is the PL1 organizer package.
- PL5 should be distributed to participants only in a reviewed player package that excludes `evidence/files/archive.flag`, solution files, and organizer-only materials.
- The final combined ZIP is intended for the group leader and contains organizer materials.

## Safety

All evidence is synthetic. Run PL5 as an isolated local Docker challenge. Do not mount sensitive host paths or expose privileged host resources to the container.
