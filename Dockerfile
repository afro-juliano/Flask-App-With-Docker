FROM python:3.11

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app
COPY pyproject.toml poetry.lock /app/

ENV PYTHONPATH=${PYTHONPATH}:${PWD}
ENV HTTP_POOL_CONNECTIONS=50

COPY . /app/

# Install app dependencies with poetry
RUN pip install poetry \
    && poetry config installer.max-workers 10 \
    && poetry install

CMD ["python", "app.py"]
