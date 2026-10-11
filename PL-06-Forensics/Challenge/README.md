# PL-06 – Forensic Timeline Reconstruction

## Domain and scenario
**Digital Forensics.** During a hospital security investigation, analysts recovered authentication, web access, and file activity records from a research server. Reconstruct the sequence of suspicious events using the evidence provided.

## Difficulty
Moderate–Hard (target; current evidence is an introductory prototype).

## Download
`PL-06-Evidence.zip` contains:
- `auth.log` – SSH authentication events
- `access.log` – web requests
- `file_activity.csv` – recorded file events
- `evidence_notes.txt` – investigation instructions

## Player tasks
1. Identify the first confirmed successful SSH login, including its timestamp, account, and source IP.
2. Correlate SSH, web, and file activity events.
3. Determine when the research export file was created and what happened afterward.
4. Produce a UTC-ordered timeline with supporting evidence references.
5. Follow the competition's verification instructions to obtain and submit the PL-06 flag.

## Suggested tools
`grep`, `sort`, `cat`, a spreadsheet or a Python script. A Docker-based Linux tools environment is supplied separately.

## Evidence integrity
Use `SHA256SUMS.txt` to check the original ZIP before investigation. Work on extracted copies and keep the original archive unchanged.

## Notes
The records are synthetic. Matching IP addresses across logs can support correlation but do not, by themselves, prove that requests belong to the same authenticated session.
