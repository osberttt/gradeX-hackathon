import json
from flask import Flask, request, jsonify
import database
import gemini

app = Flask(__name__)


@app.route("/api/exam", methods=["GET"])
def get_data():
    # Get parameters from the URL
    number = request.args.get("number")
    question = database.questions[int(number)]

    # Handle no data found case
    if not question:
        return jsonify({"message": "No data found matching your criteria"}), 404

    # Return filtered data
    return jsonify({"question": question}), 200


@app.route("/api/results", methods=["GET"])
def get_results():
    results = gemini.get_results()
    database.clean_up()
    # Handle no data found case
    if not results:
        return jsonify({"message": "No data found matching your criteria"}), 404

    # Return filtered data
    return jsonify({"results": results}), 200


@app.route("/api/exam", methods=["POST"])
def create_data():
    # Get request data
    try:
        # Assuming data is sent in JSON format
        data = request.get_json()
        database.answers.append(data["answer"])

    except (KeyError, json.JSONDecodeError) as e:
        return jsonify({"error": f"Invalid data format: {e}"}), 400

    return jsonify({"message": "Data created successfully"}), 201


if __name__ == "__main__":
    app.run(debug=True)
