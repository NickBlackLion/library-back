#!/usr/bin/env bash

python3 manage.py collectstatic --noinput
uwsgi --yaml uwsgi.yaml
