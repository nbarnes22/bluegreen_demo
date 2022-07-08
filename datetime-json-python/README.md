# Python/Flask App which returns date/time in JSON
App has two routes: / which returns Hello World and the version
and /date which returns the date/time in JSON.

Sample JSON output:
{
"date": "08/07/2022",
"time": "09:05:39:329092"
}

# Local dev environment requirements
1. Python v3.10.5 (or latest)
2. Pip v22.0.4 (or latest)
3. Docker Desktop (installed and running)
4. AWS CLI v2.7.12 (or latest)

# How to Containerize the app and store the artifact in AWS ECR
1. $ pip freeze > requirements.txt
2. Create a dockerfile (see code for this app)
3. $ docker build -t <repository name> .
4. $ aws ecr get-login-password --region <aws region> | docker login --username AWS --password-stdin <ECR URL>
5. $ docker tag <repository name>:latest <aws account number>.dkr.ecr.<aws region>.amazonaws.com/<repository name>:<version number>
6. $ docker push <aws account number>.dkr.ecr.<aws region>.amazonaws.com/<repository name>:<version number>