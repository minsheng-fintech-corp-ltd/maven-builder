#!/bin/bash
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker push $REPO:$COMMIT
docker tag $REPO:$COMMIT $REPO:latest
docker push $REPO:latest
