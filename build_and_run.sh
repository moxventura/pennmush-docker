#!/bin/env bash
docker volume create pennmush && \
docker build -t pm-builder builder/. && \
docker run --rm -v pennmush:/tmp/volume pm-builder && \
docker build -t pm-runner runner/. && \
docker run -d -p 4201:4201 -v pennmush:/home/pennmush/game pm-runner
