# IE3132 - Penetration Testing Assignment 2

## Operation PULSELOCK

**Scenario:** Real-World Smart Hospital and Research Database Breach Investigation CTF.

This repository contains challenge files, solutions and hints for the project, along with the CTF platform configuration and automated testing resources.

## Challenges

- **PL-03** — See [PL-03 challenge instructions](PL-03/challenge/README.md).
- **PL-07** — See [PL-07 challenge instructions](PL-07/challenge/README.md).

## CTF Platform Setup

The platform uses Docker Compose to run CTFd, MySQL and Redis.

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

The port is bound to localhost, so this configuration is intended for local lab use.

### Stop the platform

From the `platform` directory:

```powershell
docker compose down
```

This stops and removes the containers but preserves the named data volumes. Do not use `docker compose down -v` unless you deliberately intend to delete the stored platform data.

## Automated Testing

Member 3's test suite checks PL-03 and PL-07 challenge files, solver flags, reset behaviour and solvability after reset.

See [Automated Test Instructions](tests/README.md).

The recorded successful test run is available at [member3-test-20261009-203404.log](test-results/member3-test-20261009-203404.log).

**Latest recorded result:** 16 passed, 0 failed.

These results cover the two challenges and do not certify every aspect of the CTF platform.

## Repository Structure

- `PL-03/` — Challenge files, hints and solution resources.
- `PL-07/` — Challenge files, hints and solution resources.
- `platform/` — Docker Compose configuration and environment template.
- `tests/` — Automated test runner and instructions.
- `test-results/` — Recorded test logs.
