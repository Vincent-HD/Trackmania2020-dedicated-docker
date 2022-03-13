# Get latest build of glibc
GLIBC_TAG := $(shell curl -sL https://api.github.com/repos/sgerrand/alpine-pkg-glibc/releases | jq '.[0].tag_name')
DOCKER_TAG := tm2020-dedicated

all: build

build:
	docker build --build-arg GLIBC_TAG=${GLIBC_TAG} -t ${DOCKER_TAG} .