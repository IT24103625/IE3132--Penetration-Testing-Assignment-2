# PL1 Implementation — The Public Footprint

## 1. Purpose
PL1 is an introductory OSINT and digital-metadata challenge for
Operation PulseLock. Players investigate fictional public information
to discover a hidden archive-custodian clue.

## 2. Evidence Files
- site/public/index.html — introduces PulseLock Medical Centre and
  Project Nightingale.
- site/public/research.html — contains the research archive reference.
- site/documents/research_notice.pdf — contains the archive clue in
  its PDF metadata.
- CHALLENGE.md — player-facing scenario, objectives, rules and hints.

## 3. Investigation Path
1. Read the fictional homepage.
2. Find the research notice and identify the archive reference.
3. Inspect the PDF metadata using a tool such as ExifTool.
4. Use the discovered custodian clue to determine the challenge flag.

## 4. Local Flag Validation
Run:
    python3 check_flag.py

The local script accepts:
    PULSE{public_trace_found}

Tested outcomes:
- Correct flag: accepted.
- Incorrect flag: rejected.

## 5. Shared CTF Platform Integration
The group lead should create a PL1 challenge entry on the shared CTF
platform and configure the agreed flag there. The local Python script
is for demonstration and testing; it is not a replacement for the
platform's flag validation.

Keep the answer and developer-only files out of the public evidence
directory.

## 6. Safety
All names, locations, projects and evidence are fictional and intended
for a controlled educational challenge.
