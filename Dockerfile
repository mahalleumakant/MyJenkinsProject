FROM python:3.8-slim
WORKDIR /app
COPY helloworld.py .
CMD ["python3", "helloworld.py"]