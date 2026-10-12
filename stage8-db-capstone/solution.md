\# Stage 8 Solution

\## PULSE-08 MedCore DB-SOC Incident Investigation



\### Alert Classification



| Alert ID | Classification | Root Cause |

|-----------|---------------|------------|

| DBA-2601 | Legitimate Activity | Application credential synchronization issue |

| DBA-2602 | Legitimate Activity | Approved reporting service activity |

| DBA-2603 | Legitimate Activity | Network failover event |

| DBA-2604 | Legitimate Activity | Approved database maintenance |

| DBA-2605 | Security Incident | Unauthorized database export by expired contractor account |



\---



\## Incident Findings



\### Escalated Alert



DBA-2605



\### Account



CONTRACTOR\_READ



\### Sensitive Object



CLINICAL\_TRIAL\_RESULTS



\### Exported Rows



4827



\### Why Suspicious



\- Account expired

\- Source workstation not approved

\- Sensitive object classified as highly restricted

\- Export operation succeeded

\- No approved maintenance or business justification



\---



\## Final Flag



PULSE{DBA-2605\_CONTRACTOR\_READ\_CLINICAL\_TRIAL\_RESULTS\_4827}



\---



\## Learning Objectives



\- Database alert triage

\- Service account validation

\- Access-review analysis

\- Data exfiltration detection

\- Incident escalation decisions

\- Database Security Operations Center workflow

