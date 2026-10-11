# PL5 — Compromised Linux Host: Organizer Solution

## Investigation Walkthrough

1. Review `evidence/logs/auth.log`.
   - Identify the successful login for `backupsvc` at 09:17:32 from `203.0.113.66`.
   - Note the subsequent command searching `/srv/research`.

2. Review `evidence/system/cron.txt`.
   - Identify the additional scheduled task `medcore-health-sync`.
   - Note its owner, schedule, and executable.

3. Review `evidence/system/services.txt`.
   - Correlate the enabled `medcore-health-sync.service`.
   - Both entries use `backupsvc` and `/opt/medcore/bin/health-sync`.

4. Review `evidence/system/file_metadata.txt`.
   - Identify `/srv/research/archive.flag`.
   - It is owned by root and has permissions `0600`.

## Flag Recovery

Launch the container:

    docker compose run --rm pl5

Run the verifier:

    sudo /usr/local/sbin/verify-investigation

Expected answers:

- Suspicious account: `backupsvc`
- Persistence mechanism name: `medcore-health-sync`
- Protected artifact path: `/srv/research/archive.flag`

Expected flag:

    PULSE{host_compromise_found}

Incorrect answers are rejected by the verifier.

## Organizer Notes

- The evidence is synthetic and intended for this isolated training challenge.
- `check_flag.py` validates the submitted flag string separately.
- The shared CTFd challenge must be configured by the organizers with the expected flag.
