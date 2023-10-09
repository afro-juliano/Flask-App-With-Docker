FROM python:3.11

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
ENV PYTHONPATH=${PYTHONPATH}:${PWD}

# Install app dependencies with poetry
RUN pip3 install --upgrade pip \
    && pip3 install mysqlclient \
    && pip3 install poetry

RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

CMD ["python", "app.py"]
