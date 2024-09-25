# Import the Flask class from the flask module
from flask import Flask

# Create an instance of the Flask class for our web app
app = Flask(__name__)

# Define the route for the root URL ("/")
@app.route('/')
def index():
    # Return a simple message when the root URL is accessed
    return 'Hello Mohittt!'

# Run the app on host 0.0.0.0 and port 81
app.run(host='0.0.0.0', port=81)