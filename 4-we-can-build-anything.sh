#!/usr/bin/env bash

set -o errexit
set -o xtrace

docker_file="${1}"
image_name='bash-for-devops'

docker build \
  --file ${docker_file} \
  --tag ${image_name} \
  .

docker run \
  --init \
  --name ${image_name} \
  --rm \
  --tty \
  ${image_name}
