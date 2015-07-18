DOCKER_IMAGE_NAME=tenstartups/docker-daemon

build: Dockerfile
	docker build -t ${DOCKER_IMAGE_NAME} .

run: build
	docker run -it --rm --privileged ${DOCKER_IMAGE_NAME} ${ARGS}
