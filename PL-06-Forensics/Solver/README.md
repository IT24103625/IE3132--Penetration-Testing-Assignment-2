# PL-06 – Forensic Analysis / Solver Guide

This guide explains how to analyze the evidence without disclosing the answer.

## Preparation
Download `PL-06-Evidence.zip` from CTFd and extract it into a working directory. Preserve the original ZIP for integrity checking.

## Linux / Docker commands
```bash
grep 'Accepted password' auth.log
grep 'Failed password' auth.log
grep 'research' access.log
cat file_activity.csv
```

## Investigation approach
1. Record the timestamp, username, and source IP for confirmed successful authentication.
2. Examine the web access entries around that timestamp.
3. Compare file activity timestamps with the authentication and web records.
4. Build a chronological timeline in UTC and cite the source file for each event.
5. Submit the required findings using the organizer's validation process.

## Reproducibility
Re-extract the original archive to restart the analysis. If a provided Dockerfile is used, build and run it according to the challenge deployment instructions.

## Deployment note
This is a method guide, not an automatic flag-generating solver. The organizer must implement and test the challenge's flag-release/validation method separately.
