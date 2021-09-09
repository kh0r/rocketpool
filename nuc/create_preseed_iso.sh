#!/bin/bash

docker build -t build-preseed .
docker run --rm -v ${PWD}:/host build-preseed