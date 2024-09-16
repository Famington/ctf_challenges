from flask import Flask, request, send_from_directory, abort

app = Flask(__name__)

@app.route('/')
def index():
    return "Welcome to the wget challenge. Use the right `wget` options to find the hidden file!"

@app.route('/secret_file', methods=['GET'])
def get_file():
    # Check for a custom User-Agent to simulate a condition where the file is only accessible via `wget`
    if request.headers.get('User-Agent') == 'Wget':
        return send_from_directory('.', 'flag.txt')
    else:
        abort(403, description="Forbidden: Access is restricted. Try using wget with a custom User-Agent.")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
