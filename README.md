# IE3132 - Penetration Testing Assignment 2

## OPERATION PULSELOCK

**Real-World Smart Hospital and Research Database Breach Investigation CTF**

## Project Overview

OPERATION PULSELOCK is a controlled Capture the Flag (CTF) environment designed around a realistic smart hospital and research database breach investigation scenario.

This repository contains challenge files, hints, solutions, platform configuration, testing resources, and implementation documentation contributed by the four team members.

## Project Objectives

- Develop a structured CTF-based penetration-testing environment.
- Implement the assigned penetration-testing challenges.
- Apply practical vulnerability identification and investigation techniques.
- Test and validate challenge functionality and reset behaviour.
- Document the platform architecture, implementation, testing, and results.

## Team

| Student ID | Role |
| --- | --- |
| IT24103149 | Member 1 |
| IT24103827 | Member 2 |
| IT24103625 | Member 3 |
| IT24103403 | Member 4 |

## Challenges

- **PL-01:** See `PL1/CHALLENGE.md`.
- **PL-02:** See `PL-02-Steganography/Challenge/README.md.txt`.
- **PL-03:** See [PL-03 challenge instructions](PL-03/challenge/README.md).
- **PL-05:** See `PL5/CHALLENGE.md`.
- **PL-06:** See [PL-06 Forensics documentation](PL-06-Forensics/README.md).
- **PL-07:** See [PL-07 challenge instructions](PL-07/challenge/README.md).

Refer to the individual challenge documentation for setup instructions, hints, solutions, and other challenge-specific resources.

## CTF Platform Setup

The platform uses Docker Compose to run CTFd, MySQL, and Redis.

### Prerequisites

- Docker Desktop with Docker Compose support.
- A web browser.

### Configure the environment

From the repository root, run:

```powershell
Copy-Item platform/.env.example platform/.env
notepad platform/.env
```

Replace all placeholder values with strong, unique secret values and save the file. Keep `platform/.env` private; do not commit it to Git.

### Start the platform

```powershell
Set-Location platform
docker compose up -d
docker compose ps
```

Open **http://127.0.0.1:8000** in your browser. Complete the initial CTFd setup if required.

This configuration binds the platform to localhost and is intended for local lab use.

### Stop the platform

From the `platform` directory, run:

```powershell
docker compose down
```

This stops and removes the containers while preserving named data volumes. Do not use `docker compose down -v` unless you deliberately intend to delete stored platform data.

## Automated Testing

Member 3's test suite checks the PL-03 and PL-07 challenge files, solver outputs, reset behaviour, and solvability after reset.

See [Automated Test Instructions](tests/README.md).

A recorded successful test run is available at [member3-test-20261009-203404.log](test-results/member3-test-20261009-203404.log).

**Latest recorded result:** 16 passed, 0 failed.

These results cover the two challenges and do not certify every aspect of the complete CTF platform. Run the appropriate tests for all integrated challenges before merging into `main`.

## Repository Structure

- `PL1/` - PL-01 challenge and implementation documentation.
- `PL-02-Steganography/` - PL-02 steganography challenge resources.
- `PL-03/` - PL-03 challenge, hints, solution, solver, and reset resources.
- `PL5/` - PL-05 challenge and implementation documentation.
- `PL-06-Forensics/` - PL-06 forensic evidence and supporting resources.
- `PL-07/` - PL-07 challenge, hints, solution, solver, and reset resources.
- `platform/` - Docker Compose configuration and environment template.
- `tests/` - Automated test runner and instructions.
- `test-results/` - Recorded test logs.
- `handoff/` - Challenge handover resources.

## Branching and Integration

Each team member develops and tests their assigned work on their respective branch. Completed work is merged into `Integration` for combined testing and review.

The integrated project should be tested on `Integration` before it is merged into `main`.

## Development Environment

- Git and GitHub.
- Windows and PowerShell.
- Docker Desktop and Docker Compose.
- CTFd, MySQL, and Redis.
- Appropriate penetration-testing and security-analysis tools.

---

*IE3132 - Penetration Testing Assignment 2*
