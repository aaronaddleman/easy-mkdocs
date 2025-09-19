FROM python:3.12

RUN apt-get update && apt-get install -y \
    build-essential \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pipenv
RUN mkdir /mkdocs
WORKDIR /mkdocs
COPY ./docs /mkdocs/docs
COPY Pipfile /mkdocs/Pipfile
COPY Pipfile.lock /mkdocs/Pipfile.lock
RUN pipenv install --system --deploy
COPY ./entrypoint.sh /

ENV TEMPLATE_VER=0.0.1

EXPOSE 8000

WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
