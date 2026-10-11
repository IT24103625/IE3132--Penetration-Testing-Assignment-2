# PL-02 – The Hidden Campaign File

## Domain
Steganography

## Difficulty
Easy

## Scenario
A hospital campaign image was recovered during an
investigation into suspicious attacker communication.

Although the image appears normal, investigators suspect
that additional information has been concealed inside it.

## Learning Objective
Identify hidden information using file inspection,
metadata analysis, and steganographic extraction.

## Player Task
1. Inspect the supplied hospital campaign image.
2. Identify its file type and metadata.
3. Investigate possible hidden information.
4. Use the project code obtained from Stage 1 as a clue.
5. Extract the hidden note.
6. Recover the PL-02 flag and next-stage ciphertext.

## Recommended Tools
- file
- strings
- ExifTool
- binwalk
- steghide

## Challenge File
hospital_campaign_stego.jpg

## Rules
The challenge file is read-only evidence.
Do not modify the original file.
Work on a copy when necessary.

## Validation
Submit the recovered flag through CTFd.