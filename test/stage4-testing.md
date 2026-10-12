# PULSE-04 Testing

## Objective

Verify that the Stage 4 web application functions correctly.

## Test Cases

### Test 1 - Login

Input:

username: patient1
password: password123

Expected:

Successful login

Result:

PASS

### Test 2 - Invalid Login

Input:

invalid credentials

Expected:

Access denied

Result:

PASS

### Test 3 - Analyst Note Endpoint

Action:

Browse to /analyst-note

Expected:

Flag displayed

Result:

PASS

### Final Flag Verification

PULSE{WEB_APP_COMPROMISED}

Result:

PASS
