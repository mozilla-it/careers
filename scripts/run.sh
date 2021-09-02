#!/bin/bash

set -e

echo "starting the server"
gunicorn careers.wsgi:application -b 0.0.0.0:8000 -w 2 --timeout 300

