# app.py
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return "Welcome to the Arithmetic Operations API!"
#endpoints
@app.route('/add', methods=['GET'])
def add():
    try:
        num1 = float(request.args.get('num1'))
        num2 = float(request.args.get('num2'))
        result = num1 + num2
        return jsonify(result=result)
    except (ValueError, TypeError):
        return jsonify(error="Invalid input"), 400

@app.route('/subtract', methods=['GET'])
def subtract():
    try:
        num1 = float(request.args.get('num1'))
        num2 = float(request.args.get('num2'))
        result = num1 - num2
        return jsonify(result=result)
    except (ValueError, TypeError):
        return jsonify(error="Invalid input"), 400

@app.route('/multiply', methods=['GET'])
def multiply():
    try:
        num1 = float(request.args.get('num1'))
        num2 = float(request.args.get('num2'))
        result = num1 * num2
        return jsonify(result=result)
    except (ValueError, TypeError):
        return jsonify(error="Invalid input"), 400

@app.route('/divide', methods=['GET'])
def divide():
    try:
        num1 = float(request.args.get('num1'))
        num2 = float(request.args.get('num2'))
        if num2 == 0:
            return jsonify(error="Division by zero"), 400
        result = num1 / num2
        return jsonify(result=result)
    except (ValueError, TypeError):
        return jsonify(error="Invalid input"), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
