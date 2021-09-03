#!/bin/bash

set -e

s3Publish=${s3Publish:-false}

# sync from greenhouse
python manage.py sync_greenhouse

# build the static site
python manage.py build

# and possibly publish to s3
if [ "$s3Publish" = "true" ]
then
    echo 'syncing to s3'
    python manage.py publish;
fi

# ping dead man snitch
curl "$DMS"
