from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return f"Hola, ahora con CI/CD funcionando: {request.remote_addr}\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5050)
