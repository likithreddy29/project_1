from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello_world():
    return jsonify(message="Hello, World! Welcome to the GitOps Pipeline.")

@app.route('/health')
def health_check():
    # The SRE validation loop will ping this endpoint to verify container stability
    return jsonify(status="healthy"), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
