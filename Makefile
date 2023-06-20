.SILENT:
.PHONY: help

export FLASK_DEBUG := 1
export FLASK_APP := app

up: ## stand up container
	@docker-compose up

down: ## tear down container
	@docker-compose down

start: ## start app in container
	@docker-compose start

stop: ## stop app in container
	@docker-compose stop

test: ## run tests in container
	@docker-compose run api poetry run python -m pytest -vvvvv

shell: ## run a shell for the flask app in container
	@docker-compose run api poetry run flask shell

init-db: ## initialize db
	@docker-compose run api poetry run flask db init

make-migration: ## auto-generate migrations from schema changes
	@docker-compose run api poetry run flask db migrate

migrate: ## run current migrations
	@docker-compose run api poetry run flask db upgrade

migrate-down: ## migrate to previous version
	@docker-compose run api poetry run flask db downgrade

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help