# PL1 — The Public Footprint

**Operation:** PulseLock  
**Difficulty:** Introductory  
**Category:** OSINT / Digital Metadata

## Scenario

PulseLock Medical Centre is reviewing its public information after
an unusual reference to a research archive was discovered.

You have been asked to investigate the fictional public information
provided with this challenge.

## Objective

Identify the archive custodian's reference and submit the correct
flag.

## Available evidence

- `site/public/index.html` — fictional hospital homepage
- `site/public/research.html` — fictional research notice
- `site/documents/research_notice.pdf` — fictional research document

## Rules

- Use only the supplied fictional evidence.
- Do not target real websites or systems.
- Inspect document properties as well as visible document content.
- Submit the flag using the challenge's configured validation method.

## Hints

1. Start with the research project mentioned on the homepage.
2. Compare the project name with the archive reference in the research notice.
3. Inspect the PDF's Creator and Keywords metadata fields for the final clue.

## Reset

Restore the original challenge files from the distributed project
copy or version-controlled source.
