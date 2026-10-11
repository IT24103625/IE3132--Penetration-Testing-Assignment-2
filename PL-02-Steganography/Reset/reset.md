# PL-02 Reset and Recovery

## Reset Method
PL-02 uses immutable downloadable evidence.

## Procedure
1. Delete the participant's modified local copy.
2. Download the original challenge image from CTFd.
3. Verify the image SHA-256 checksum.
4. Restart the investigation using the original file.

## Recovery
No server-side reset is required because the challenge
does not modify a shared application or database.
