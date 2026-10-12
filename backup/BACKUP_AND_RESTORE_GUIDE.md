# Operation PulseLock Backup and Restore Guide

## Environment

Platform: CTFd

Containerization: Docker

Database: MariaDB

Database Name:

```text
ctfd
```

---

# Backup Procedure

## Export Database

Open Command Prompt.

Run:

```cmd
docker exec ctfd-db-1 mysqldump -u root -pctfd ctfd > ctfd_backup.sql
```

This creates:

```text
ctfd_backup.sql
```

containing:

- Challenges
- Flags
- Hints
- Challenge Requirements
- Users
- Teams (if enabled)
- Solve History
- Scoreboard Data

---

# Backup Docker Environment

Create a zip archive containing:

```text
docker-compose.yml
CTFd/
```

Example:

```text
OperationPulseLock-CTFd-Backup.zip
```

---

# Restore Procedure

## Start Docker Services

Navigate to the folder containing:

```text
docker-compose.yml
```

Run:

```cmd
docker compose up -d
```

---

## Restore Database

Import the backup:

```cmd
docker exec -i ctfd-db-1 mysql -u root -pctfd ctfd < ctfd_backup.sql
```

---

# Verification

Open:

```text
http://localhost:8000
```

Verify:

✓ PULSE-01 to PULSE-09 exist

✓ Hints exist

✓ Requirements chain exists

✓ Flags are configured

✓ Scoreboard loads correctly

---

# Recovery Notes

Operation PulseLock maintains:

1. GitHub Repository Backup
2. Docker Environment Backup
3. MariaDB Database Backup

These backups enable full restoration of the CTF environment.

## Additional Offline Backup

A full Docker environment backup archive:

OperationPulseLock-CTFd-Backup.zip

is maintained separately because GitHub web uploads have file-size limitations.

The archive contains:

- docker-compose.yml
- CTFd deployment files
- environment configuration
- Docker resources required for redeployment

This archive can be used together with:

ctfd_backup.sql

to fully restore the Operation PulseLock platform.
