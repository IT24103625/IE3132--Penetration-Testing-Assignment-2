# PL-06 – Forensic Timeline Verifier

## Purpose
This service validates forensic findings submitted by
participants in PL-06 of Operation PulseLock.

## Technology
- Python 3.12
- Docker
- Docker Compose
- HTTP verification interface

## Local Testing
The verifier runs at:

http://localhost:5051

## Required Private Files
- verifier.py – Contains forensic answer validation
- .env – Contains the PL-06 flag

These files must be transferred privately to the
group integration administrator.

## Build and Run
After the private files are provided:

docker compose up -d --build

## Verification
docker compose ps

## Group Integration
Deploy the verifier behind an HTTPS reverse proxy.
Update the PL-06 CTFd challenge description with
the participant-accessible verifier URL.

## Security
Do not publish private answers or flags.
Do not expose the development HTTP server directly
to the public internet.
