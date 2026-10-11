# PL-06 – Forensic Timeline Reconstruction

**Operation PulseLock | Member 2 | Digital Forensics**

## Overview
Players investigate synthetic hospital server evidence to reconstruct the order of suspicious authentication, web access, and file activity. The challenge uses downloadable, read-only evidence rather than a live service.

## Files and directories
- `challenge/README.md` – player instructions and evidence description
- `challenge/PL-06-Evidence.zip` – add the existing evidence archive locally
- `challenge/Dockerfile` – add the existing forensic tools image definition locally
- `challenge/SHA256SUMS.txt` – add the checksum for the final evidence archive
- `hints/hints.md` – progressive hints (prepared separately)
- `reset/reset.md` – recovery procedure (prepared separately)
- `solution/README.md` – public-safe administrator documentation; private answers stored outside the public repository
- `solver/README.md` – reproducible analysis guidance without revealing the answer

## Deployment
Upload the evidence ZIP to the PL-06 CTFd challenge. Configure the intended scoring (350 points) and hints in CTFd. Confirm that the flag is discoverable through the challenge's final validation design before publication.

## Current limitations
The existing synthetic evidence is a basic timeline exercise. Add realistic background activity and a verifiable way for participants to earn the flag before treating this as the final moderate-hard stage. Do not publish private answer keys, solution timelines, secrets, or flags in a public repository.
