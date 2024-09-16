FROM python:3.8-slim
WORKDIR /app
COPY app.py /app
COPY flag.txt /app

RUN pip install Flask

CMD ["python", "app.py"]
