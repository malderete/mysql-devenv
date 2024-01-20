.DEFAULT_GOAL := help

IMAGE_TAG = mysql-devenv
PROJECT_DIR = "$(HOME)/projects/mysql-server"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

build: ## Build a docker image tagged mysql-devenv
	docker build . -f Dockerfile -t $(IMAGE_TAG)

start: ## Start a docker container in background from mysql-devenv
	- docker run -d --rm --name $(IMAGE_TAG) --volume=$(PROJECT_DIR):/development/mysql $(IMAGE_TAG)

stop: ## Stop the docker container
	- docker stop $(IMAGE_TAG)

shell: ## Execute bash inside the container in interactive mode
	- docker exec -it $(IMAGE_TAG) bash
