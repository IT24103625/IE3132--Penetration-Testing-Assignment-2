# PL5 — Compromised Linux Host

**Operation:** PulseLock  
**Category:** Linux / System Security  
**Difficulty:** Moderate–Hard  
**Points:** 300

## Scenario

PulseLock Medical Centre detected suspicious activity on a Linux host. Investigate the supplied synthetic evidence to identify the suspicious account, persistence mechanism, and protected artifact.

## Objectives

1. Identify suspicious authentication activity.
2. Correlate the scheduled task with the enabled service.
3. Examine the protected artifact's owner, permissions, and location.
4. Verify your findings and recover the stage flag.

## Start the Challenge

From this directory, run:

    docker compose run --rm pl5

The shell opens as the unprivileged analyst user. Evidence is available under `/opt/pulselock/evidence/`.

Review:
- `logs/auth.log`
- `system/cron.txt`
- `system/services.txt`
- `system/file_metadata.txt`
- `files/research_archive.txt`

## Recover the Flag

After investigating, run:

    sudo /usr/local/sbin/verify-investigation

Enter the suspicious account, persistence mechanism name, and protected artifact path when prompted. All three answers must be correct for the flag to be displayed.

Submit the exact, case-sensitive flag in the format `PULSE{...}` to the shared CTFd platform.

## Rules

- Use only the supplied challenge environment and evidence.
- Do not target real systems or modify the host operating system.
- Do not alter real system services.
- The temporary container is removed when you exit.

## Hints

1. Start with the authentication log.
2. Compare the scheduled task and service account and executable.
3. Check the protected artifact's owner, permissions, and path.
