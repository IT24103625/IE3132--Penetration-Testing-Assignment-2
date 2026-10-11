
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import parse_qs
from html import escape
import os
import hmac

EXPECTED = {
    "login_time": "2026-09-18T09:14:22Z",
    "username": "researcher",
    "source_ip": "10.10.20.45",
    "creation_time": "2026-09-18T09:18:40Z",
    "deleted_file": "research_export.csv",
}

FIELDS = [
    ("login_time", "First successful SSH login (UTC)"),
    ("username", "Affected username"),
    ("source_ip", "Source IP address"),
    ("creation_time", "Research export creation time (UTC)"),
    ("deleted_file", "Deleted research filename"),
]


def page(message=""):
    fields = "".join(
        f'<label>{escape(label)}</label>'
        f'<input name="{key}" required autocomplete="off">'
        for key, label in FIELDS
    )
    return f"""<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>PL-06 Timeline Verification</title>
<style>
body {{ font-family: Arial; background: #eef2f6; }}
main {{ max-width: 550px; margin: 45px auto;
        background: white; padding: 30px; border-radius: 10px; }}
label {{ display: block; margin-top: 15px; }}
input {{ width: 95%; padding: 10px; margin-top: 5px; }}
button {{ margin-top: 20px; padding: 12px 20px; }}
</style>
</head>
<body><main>
<h2>PL-06 – Forensic Timeline Verification</h2>
<p>Analyze the supplied forensic evidence and enter your findings.</p>
<form method="post">
{fields}
<button type="submit">Verify Timeline</button>
</form>
<p>{message}</p>
</main></body></html>"""


class Handler(BaseHTTPRequestHandler):
    def respond(self, body):
        data = body.encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def do_GET(self):
        self.respond(page())

    def do_POST(self):
        length = int(self.headers.get("Content-Length", "0"))
        if length > 8192:
            self.send_error(413)
            return

        submitted = parse_qs(
            self.rfile.read(length).decode("utf-8")
        )

        correct = all(
            hmac.compare_digest(
                submitted.get(key, [""])[0].strip(),
                expected
            )
            for key, expected in EXPECTED.items()
        )

        if correct:
            flag = escape(os.environ["PL06_FLAG"])
            message = f"<strong>Verified! Flag: {flag}</strong>"
        else:
            message = "<strong>Incorrect timeline. Review the logs.</strong>"

        self.respond(page(message))


if __name__ == "__main__":
    if not os.environ.get("PL06_FLAG"):
        raise RuntimeError("PL06_FLAG environment variable is required")
    print("PL-06 verifier running on port 5050", flush=True)
    HTTPServer(("0.0.0.0", 5050), Handler).serve_forever()
