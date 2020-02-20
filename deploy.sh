#!/bin/bash
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker push $REPO:java8-${BUILDPACK_LIFECYCLE}-$COMMIT
docker tag $REPO:java8-${BUILDPACK_LIFECYCLE}-$COMMIT $REPO:java8-${BUILDPACK_LIFECYCLE}-latest
docker push $REPO:java8-${BUILDPACK_LIFECYCLE}-latest
docker push $REPO:java11-${BUILDPACK_LIFECYCLE}-$COMMIT
docker tag $REPO:java11-${BUILDPACK_LIFECYCLE}-$COMMIT $REPO:java11-${BUILDPACK_LIFECYCLE}-latest
docker push $REPO:java11-${BUILDPACK_LIFECYCLE}-latest