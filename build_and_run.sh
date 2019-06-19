#!/usr/bin/env bash
docker volume create pennmush && \
docker volume create pennmush-backup && \
docker build -t pm-builder builder/. && \
docker run --rm -v pennmush:/tmp/volume pm-builder && \
docker build -t pm-runner runner/. && \
docker build -t pm-backup backup/. && \
docker run --rm -dit -p 4201:4201 -v pennmush:/home/pennmush/game --name pennmush pm-runner && \
docker run --rm -dit -v pennmush:/source -v pennmush-backup:/target --name pennmush-backup pm-backup
