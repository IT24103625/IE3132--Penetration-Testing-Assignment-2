# PL-06 – Administrator Solution Notes (Public-Safe)

This directory documents the solution workflow **without publishing the answers**.

## Private material (do not commit)
Keep the following outside the public repository:
- `solution_timeline.csv` containing the expected event sequence
- the final PL-06 flag and any verification secrets
- any instructor-only marking rubric with exact answers

## Administrator verification workflow
1. Extract a fresh copy of `PL-06-Evidence.zip`.
2. Identify successful and failed authentication attempts in `auth.log`.
3. Correlate related web requests in `access.log`.
4. Order file creation, upload, and deletion records from `file_activity.csv`.
5. Normalize timestamps to UTC, compare with the private answer key, and confirm the required findings.
6. Test the intended flag-release/validation mechanism from a player account before publishing.

## Quality checks
Ensure the downloadable archive contains no private solutions. Verify that the checksum matches the final archive and that resets work by redownloading it.
