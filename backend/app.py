from flask import Flask, request, jsonify
from flask_cors import CORS
from sentence_transformers import SentenceTransformer

app = Flask(__name__)
CORS(app)  # allow calls from your Flutter app

model = SentenceTransformer('all-MiniLM-L6-v2')

@app.route('/embed', methods=['POST'])
def get_embedding():
    data = request.get_json()
    text = data.get('text', '')

    if not text:
        return jsonify({'error': 'No text provided'}), 400

    embedding = model.encode([text])[0]
    return jsonify({'embedding': embedding.tolist()})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
