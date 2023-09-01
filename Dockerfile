FROM python:3.11-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# Install app dependencies with poetry
RUN poetry update \
    && poetry shell \
    && poetry add mysqlclient \
    && poetry add black \
    && poetry add flask \
    && poetry add flask_mysqlb \
    && poetry add flake8

CMD ["python", "app.py"]
