from datetime import datetime
from flask import Flask, jsonify

# Create an instance of the Flask class that is the WSGI application.
# The first argument is the name of the application module or package,
# typically __name__ when using a single module.
app = Flask(__name__)

# Flask route decorators map / and /hello to the hello function.
# To add other resources, create functions that generate the page contents
# and add decorators to define the appropriate resource locators for them.


@app.route('/')
def hello():
    # Render the page
    # Print Hello World? in v1.0.1
    # Print Hello World! in v1.0.2
    return "Hello World!"


@app.route('/date')
def date():
    # Render the page
    # datetime object containing current date and time
    now = datetime.now()
    # dd/mm/YY H:M:S
    dt_string1 = now.strftime("%d/%m/%Y")
    dt_string2 = now.strftime("%H:%M:%S:%f")

    return jsonify(
        date=dt_string1,
        time=dt_string2
    )


if __name__ == '__main__':
    # Run the app server on localhost:5000
    app.run(debug=False)
    app.run('localhost', 5000)