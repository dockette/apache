DOCKER_IMAGE=dockette/apache
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} apache2 -v
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} apache2ctl -t

.PHONY: run
run:
	docker run --rm -it -p 8080:80 -v ${PWD}:/srv ${DOCKER_IMAGE}:${DOCKER_TAG}
