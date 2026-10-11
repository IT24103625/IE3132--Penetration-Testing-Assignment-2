# Stage 4 Deployment Guide

## Navigate to Stage 4

```bash
cd stage4-web-security
```

## Build Docker Image

```bash
docker build -t pulselock-stage4 .
```

## Run Container

```bash
docker run -d -p 5000:5000 --name stage4 pulselock-stage4
```

## Access Portal

```text
http://localhost:5000
```

## Credentials

Username: patient1

Password: Welcome123

## Flag

PULSE{portal_access_confirmed}