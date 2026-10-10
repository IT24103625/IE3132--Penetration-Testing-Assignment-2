from flask import Flask, render_template, request, redirect, session

app = Flask(__name__)
app.secret_key = "PulseLockSecret2026"

USERNAME = "patient1"
PASSWORD = "Welcome123"

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/portal", methods=["GET", "POST"])
def portal():

    if request.method == "POST":

        username = request.form.get("username")
        password = request.form.get("password")

        if username == USERNAME and password == PASSWORD:
            session["authenticated"] = True
            return redirect("/dashboard")

        return render_template(
            "login.html",
            error="Invalid Username or Password"
        )

    return render_template("login.html")

@app.route("/dashboard")
def dashboard():

    if "authenticated" not in session:
        return redirect("/portal")

    return render_template("dashboard.html")

@app.route("/analyst-note")
def analyst_note():

    if "authenticated" not in session:
        return redirect("/portal")

    return render_template("analyst_note.html")

@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)