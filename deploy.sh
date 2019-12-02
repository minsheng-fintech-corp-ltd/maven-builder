#!/bin/bash
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker push $REPO:java8-$COMMIT
docker tag $REPO:java8-$COMMIT $REPO:java8-latest
docker push $REPO:java8-latest
docker push $REPO:java11-$COMMIT
docker tag $REPO:java11-$COMMIT $REPO:java11-latest
docker push $REPO:java11-latest