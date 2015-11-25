DOCKER_IMAGE_NAME := tenstartups/docker-daemon

build: Dockerfile
	docker build --file Dockerfile --tag $(DOCKER_IMAGE_NAME) .

clean_build: Dockerfile
	docker build --no-cache --file Dockerfile --tag $(DOCKER_IMAGE_NAME) .

run: build
	docker run -it --rm --privileged --net host --name docker-daemon ${DOCKER_IMAGE_NAME} ${ARGS}

push: build
	docker push ${DOCKER_IMAGE_NAME}:latest
