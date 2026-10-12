# PULSE-09 Research Agent Analysis

## Purpose

This document describes how to build the challenge executable.

---

## Requirements

- Python 3.12+
- PyInstaller

Install PyInstaller:

```bash
pip install pyinstaller
```

---

## Source File

Challenge source:

```text
research_agent.py
```

---

## Build Command

Execute:

```bash
pyinstaller --onefile research_agent.py
```

---

## Output

Generated executable:

```text
dist/research_agent.exe
```

---

## Files Provided To Players

Only distribute:

```text
research_agent.exe
```

Do NOT distribute:

```text
research_agent.py
solution.md
build-instructions.md
```

---

## Challenge Objective

Participants must:

1. Analyze the executable.
2. Recover the hidden authorization key.
3. Enter the correct key.
4. Obtain the flag.

---

## Authorization Key

```text
RESEARCH2026
```

---

## Flag

```text
PULSE{AGENT_ANALYSIS_COMPLETE}
```

---

## Intended Solution

Participants should inspect the executable using reverse engineering techniques and recover the runtime-generated authorization key.

Once the correct key is supplied, the application reveals the challenge flag.