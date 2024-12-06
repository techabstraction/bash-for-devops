#!/usr/bin/env bash

image_name='bash-for-devops'

docker build \
  --file Dockerfile \
  --tag ${image_name} \
  .

docker run \
  --init \
  --name ${image_name} \
  --rm \
  --tty \
  ${image_name}
