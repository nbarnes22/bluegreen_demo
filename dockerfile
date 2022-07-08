# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster
# Set app directory
ENV APP_DIR=/app
# Creating Application Source Code Directory
RUN mkdir -p /$APP_DIR
# Setting Home Directory for containers
WORKDIR /$APP_DIR
# Installing python dependencies
COPY requirements.txt /$APP_DIR
RUN pip3 install --no-cache-dir -r requirements.txt
# Copying src code to Container
COPY datetime_json.py /$APP_DIR
# Run server
EXPOSE 5000
ENV FLASK_APP=datetime_json.py
# Running Python Application
ENTRYPOINT [ "flask"]
CMD ["run", "--host", "0.0.0.0"]
