# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

#WORKDIR /datetime_json

#COPY requirements.txt requirements.txt
#RUN pip3 install -r requirements.txt

#COPY . .

#CMD [ "python3", "-m" , "datetime_json", "run", "--host=0.0.0.0"]

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
# CMD ["python3", "datetime_json.py"]
ENTRYPOINT [ "flask"]
CMD ["run", "--host", "0.0.0.0"]
