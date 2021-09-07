FROM python:3.9-slim-buster

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

EXPOSE 8000

RUN adduser --uid 10001 --disabled-password --gecos '' --no-create-home app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential wget curl sed jq libfile-mimeinfo-perl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN chown app /app

RUN mkdir /app/static-build

# First copy requirements.txt and peep so we can take advantage of
# docker caching.
COPY requirements.txt requirements.txt
RUN pip install --require-hashes --no-cache-dir -r requirements.txt

RUN python manage.py collectstatic --noinput

COPY --chown=app . /app

USER app

CMD ./scripts/run.sh

