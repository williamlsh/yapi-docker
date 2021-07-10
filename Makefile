GIT_TAG := $(shell git describe --tags)
IMAGE ?= ghcr.io/williamlsh/yapi-docker:$(GIT_TAG)

SERVICE ?= yapi

.PHONY: build
build:
	@docker build -t $(IMAGE) .

.PHONY: push
push:
	@docker push $(IMAGE)

.PHONY: up
up: down
	@docker-compose up -d

.PHONY: down
down:
	@docker-compose down

.PHONY: logs
logs:
	@docker-compose logs -f $(SERVICE)
