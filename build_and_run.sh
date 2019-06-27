#!/usr/bin/env bash
NAME=${1:-penn}
PORT=${2:-4201}
docker volume create ${NAME}mush && \
docker volume create ${NAME}mush-backup && \
docker build -t pm-builder builder/. && \
docker run --rm -v ${NAME}mush:/tmp/volume pm-builder && \
docker build -t pm-runner runner/. && \
docker build -t pm-backup backup/. && \
docker run -dit -p ${PORT}:4201 -v ${NAME}mush:/home/pennmush/game --name ${NAME}mush pm-runner && \
docker run --rm -dit -v ${NAME}mush:/source -v ${NAME}mush-backup:/target --name ${NAME}mush-backup pm-backup
