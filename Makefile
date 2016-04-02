DOCKER_REGISTRY=
DOCKER_IMAGE_TAG=docker-library-alpine

build:
	docker build \
		--build-arg HTTP_PROXY=$(HTTP_PROXY) \
		-t $(DOCKER_REGISTRY)$(DOCKER_IMAGE_TAG) .

install-gc:
	gcloud docker push $(DOCKER_REGISTRY)$(DOCKER_IMAGE_TAG)