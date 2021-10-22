#!/bin/sh

ACCOUNT="maxmind"
PROJECT="geoipupdate"
ARCH="amd64"
KERNEL=$(uname -s | tr '[A-Z]' '[a-z]')

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/${ACCOUNT}/${PROJECT}/releases/latest)
LATEST_VERSION=$(echo ${LATEST_RELEASE} | sed -e 's/.*"tag_name":"v\([^"]*\)".*/\1/')
ARTIFACT_NAME="${PROJECT}_${LATEST_VERSION}_${KERNEL}_${ARCH}"
ARTIFACT_FILE="${ARTIFACT_NAME}.tar.gz"

ARTIFACT_URL="https://github.com/${ACCOUNT}/${PROJECT}/releases/download/v${LATEST_VERSION}/${ARTIFACT_FILE}"

curl -LO ${ARTIFACT_URL}

tar xvfz ${ARTIFACT_FILE}
mv ${ARTIFACT_NAME} ${PROJECT}