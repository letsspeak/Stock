#!/bin/bash

set -o verbose

echo "> currentDirectory: $(pwd)"
echo "> DOCKER_IMAGE: ${DOCKER_IMAGE}"
echo "> SWIFT_SNAPSHOT: ${SWIFT_SNAPSHOT}"
echo "> TRAVIS_BUILD_DIR: ${TRAVIS_BUILD_DIR}"

if [ -n "${DOCKER_IMAGE}" ]; then
    docker pull ${DOCKER_IMAGE}
    docker run --env SWIFT_SNAPSHOT=${SWIFT_SNAPSHOT} --env TRAVIS_BUILD_DIR=${TRAVIS_BUILD_DIR} -v ${TRAVIS_BUILD_DIR}:${TRAVIS_BUILD_DIR} ${DOCKER_IMAGE} /bin/bash -c "apt-get update && apt-get install -y git sudo lsb-release wget libxml2 curl libicu-dev uuid-dev libmysqlclient-dev && eval \"\$(curl -sL https://apt.vapor.sh)\" && sudo apt-get -y install vapor && sudo chmod -R a+rx /usr/ && cd $TRAVIS_BUILD_DIR && ./build.sh"
else
    git clone -b skip-cleanup https://github.com/letsspeak/Package-Builder.git
    ./Package-Builder/build-package.sh -projectDir ${TRAVIS_BUILD_DIR} --skip-cleanup
fi
