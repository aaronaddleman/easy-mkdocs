#!/bin/sh

set -e
set -x

if [ "$1" = 'init_project' ]; then
    # test for /app/ dir, if its missing, we exit with msg
    [ ! -d /app/ ] && (>&2 echo "Missing /app/ directory. Exiting."; kill -INT $$)
    # test /app/mkdocs.yml exists
    [ -f /app/mkdocs.yml ] && (>&2 echo "/app/mkdocs.yml exists. Remove this file before continuing. Exiting."; kill -INT $$)
    # test /app/docs directory exists
    [ -d /app/docs ] && (>&2 echo "/app/docs exists. Remove this dir before continuing. Exiting."; kill -INT $$)
    # copy the files from $TEMPLATE_VER to WORKDIR
    cp -vR /mkdocs/docs/templates/${TEMPLATE_VER}/* /app/
fi

# build mkdocs command based on params

if [ "$1" = 'serve' ]; then
    set -- mkdocs serve
    set -- "$@" --dev-addr 0.0.0.0:8000
    exec "$@"
fi


if [ "$1" = 'gh-deploy' ]; then
    mkdocs gh-deploy
fi

if [ "$1" = 'mkdocs' ]; then
    set -- mkdocs
    exec "$@"
fi
