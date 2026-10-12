# PULSE-08 Testing

## Objective

Verify DB-SOC investigation workflow.

## Test Cases

### Test 1

Review alerts.

Expected:

Identify DBA-2605 as incident.

Result:

PASS

### Test 2

Correlate account information.

Expected:

CONTRACTOR_READ identified.

Result:

PASS

### Test 3

Determine exported rows.

Expected:

4827 rows.

Result:

PASS

### Final Flag Verification

PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}

Result:

PASS
