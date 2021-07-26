FROM python:3.9.6-buster

RUN pip3 install pipenv
RUN mkdir /mkdocs
WORKDIR /mkdocs
COPY ./docs /mkdocs/docs
COPY Pipfile /mkdocs/Pipfile
COPY Pipfile.lock /mkdocs/Pipfile.lock
RUN pipenv install --system --deploy --ignore-pipfile
COPY ./entrypoint.sh /

ENV TEMPLATE_VER=0.0.1

EXPOSE 8000

WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
