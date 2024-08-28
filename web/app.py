from flask import Flask

app = Flask(__name__)


@app.route('/home')
def hello():
    return "Hello, World! Welcome to the EC2 web application."


if __name__ == '__main__':
    app.run(debug=True)
