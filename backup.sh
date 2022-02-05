#!/usr/bin/env bash

# https://restic.readthedocs.io/en/latest/index.html

docker run --rm -v ${HOME}:/data \
  -e RESTIC_REPOSITORY=s3:s3.amazonaws.com/bucket_name \
  -e RESTIC_PASSWORD=my-secure-password \
  -e AWS_ACCESS_KEY_ID=my-aws-access-key \
  -e AWS_SECRET_ACCESS_KEY=my-aws-secret-key \
  instrumentisto/restic backup /data
