# Dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

COPY service-account-file.json /app/service-account-file.json

ENV GOOGLE_APPLICATION_CREDENTIALS="/app/service-account-file.json"

ENV PORT 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
