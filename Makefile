.PHONY: build
build:
	@docker build -t yapi .

.PHONY: up
up:
	@docker-compose up -d

.PHONY: down
down:
	@docker-compose down
