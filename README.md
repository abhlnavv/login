

🧩 Step-by-Step Guide (for Beginners)


---

🪟 Step 1: Prepare Your Computer

1️⃣ Install Python

Go to 👉 https://www.python.org/downloads/

Click “Download Python 3.x.x”

When installing: ✅ Check this box → “Add Python to PATH”
Then click Install Now.


✅ Check after install:

Open “Command Prompt” (press Windows + R, type cmd, press Enter).
Type:

python --version

If you see something like Python 3.11.4, you’re good!


---

2️⃣ Install Node.js (for frontend)

Go to 👉 https://nodejs.org/

Click “LTS” version (Recommended for most users).

Install with default options (Next → Next → Finish).


✅ Check after install: In Command Prompt:

node --version
npm --version

You’ll see both versions printed (e.g. v20.0.0 and 10.0.0).


---

3️⃣ Install VS Code (for editing code)

Go to 👉 https://code.visualstudio.com/

Click “Download for Windows”

Install with default options.



---

🧩 Step 2: Create Project Folder

Now create a folder anywhere on your PC, like:

C:\Users\<YourName>\Documents\FakeNewsApp


---

🐍 Step 3: Set Up the Backend (ML + Flask)

1️⃣ Open VS Code

Click File → Open Folder → select your FakeNewsApp folder.

Open a terminal inside VS Code (menu: Terminal → New Terminal).


2️⃣ Create a folder called backend

Type in terminal:

mkdir backend
cd backend

3️⃣ Create a virtual environment (safe Python space)

Type:

python -m venv venv

Then activate it:

venv\Scripts\activate

(You’ll see (venv) appear in terminal — means it’s ON.)


---

4️⃣ Install needed Python libraries

Type this (copy–paste and press Enter):

pip install flask flask-cors scikit-learn pandas numpy


---

5️⃣ Create your first file train_model.py

In VS Code:

Inside backend → right-click → New File → name it train_model.py

Paste this code:


import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import pickle

# Small example dataset
data = {
    "text": [
        "Government launches new education policy",
        "Aliens landed on Earth last night",
        "Stock market hits record high today",
        "Celebrity found dead but alive next day",
        "Scientists discovered water on Mars",
        "Vaccine gives people magnetic powers"
    ],
    "label": ["real", "fake", "real", "fake", "real", "fake"]
}

df = pd.DataFrame(data)

X_train, X_test, y_train, y_test = train_test_split(df["text"], df["label"], test_size=0.2, random_state=42)

vectorizer = TfidfVectorizer(stop_words="english", max_features=5000)
X_train_vec = vectorizer.fit_transform(X_train)

model = LogisticRegression()
model.fit(X_train_vec, y_train)

# Save model & vectorizer
pickle.dump(vectorizer, open("tfidf.pkl", "wb"))
pickle.dump(model, open("clf.pkl", "wb"))

print("✅ Model trained and saved successfully!")

Now run it:

python train_model.py

If it says “✅ Model trained and saved successfully!”, good!
You’ll see tfidf.pkl and clf.pkl files created.


---

6️⃣ Create your Flask API (app.py)

Create a new file app.py and paste this:

from flask import Flask, request, jsonify
from flask_cors import CORS
import pickle

app = Flask(__name__)
CORS(app)

tfidf = pickle.load(open("tfidf.pkl", "rb"))
model = pickle.load(open("clf.pkl", "rb"))

@app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json()
    text = data.get("text", "")
    if not text:
        return jsonify({"error": "No text provided"}), 400
    X = tfidf.transform([text])
    label = model.predict(X)[0]
    prob = model.predict_proba(X)[0].max()
    return jsonify({"label": label, "confidence": round(float(prob)*100, 2)})

@app.route("/")
def home():
    return "Fake News Detection API is running!"

if __name__ == "__main__":
    app.run(debug=True)

Now run it:

python app.py

If you see:

Running on http://127.0.0.1:5000/

✅ Your backend (ML API) is live!


---

💻 Step 4: Create the Frontend (React)

Open a new terminal in VS Code (don’t close the backend one).

1️⃣ Create frontend folder

cd ..
npx create-react-app frontend
cd frontend

This will take a few minutes — it creates all React files automatically.


---

2️⃣ Edit the main file

In VS Code:

Open frontend/src/App.js

Delete everything, and paste this:


import React, { useState } from "react";
import "./App.css";

function App() {
  const [text, setText] = useState("");
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const analyzeText = async () => {
    if (!text.trim()) return;
    setLoading(true);
    const response = await fetch("http://127.0.0.1:5000/predict", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ text }),
    });
    const data = await response.json();
    setResult(data);
    setLoading(false);
  };

  return (
    <div className="App">
      <h1>📰 Fake News Detection</h1>
      <textarea
        placeholder="Type or paste any news text here..."
        rows="6"
        value={text}
        onChange={(e) => setText(e.target.value)}
      ></textarea>
      <br />
      <button onClick={analyzeText}>
        {loading ? "Analyzing..." : "Check News"}
      </button>
      {result && (
        <div className="result">
          <h3>Prediction: {result.label.toUpperCase()}</h3>
          <p>Confidence: {result.confidence}%</p>
        </div>
      )}
    </div>
  );
}

export default App;


---

3️⃣ Add basic styling (optional)

Open frontend/src/App.css and paste:

.App {
  text-align: center;
  font-family: Arial;
  margin-top: 40px;
}

textarea {
  width: 80%;
  font-size: 16px;
  padding: 10px;
}

button {
  margin-top: 15px;
  padding: 10px 20px;
  font-size: 16px;
}

.result {
  margin-top: 20px;
  background-color: #f3f3f3;
  padding: 15px;
  border-radius: 10px;
  display: inline-block;
}


---

4️⃣ Start the frontend:

npm start

✅ It will automatically open your browser at
👉 http://localhost:3000


---

🎉 Step 5: Test Your App!

Type: “Aliens landed on Earth” → click Check News
→ It will show: Fake (Confidence 95%)

Type: “Government announced new budget” → Real


Congratulations 🎊 — you just built your first full-stack ML web app!


---

💡 Step 6: Run Anytime

To run again later:

1. Open VS Code


2. Activate backend:

cd FakeNewsApp/backend
venv\Scripts\activate
python app.py


3. Open new terminal for frontend:

cd ../frontend
npm start




---

Would you like me to make a ZIP file of this entire project (ready to download)
so you can just extract and follow these steps directly?
It’ll include all folders and files already set up.

