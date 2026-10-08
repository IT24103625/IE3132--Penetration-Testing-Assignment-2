# PL-07 Hints

## Hint 1 — 5% Penalty

> Start with the timeline.

Use the information from the previous investigation stage to narrow the packet capture to the relevant period.

Look closely at traffic around **22:47**.

---

## Hint 2 — 10% Penalty

> Look for unusual outbound communication.

Examine the connections occurring during the suspicious timeframe.

Compare internal hospital traffic with connections leaving the research workstation.

---

## Hint 3 — 15% Penalty

> Reconstruct the conversation.

Once you identify the unusual TCP connection, follow its TCP stream.

The transferred information is split across multiple packets, so inspecting individual packets may not reveal the complete message.
