server:
	npx nodos server

test:
	npm -s test

compose:
	docker-compose up -d

compose-production:
	docker-compose --file docker-compose.yml run production

compose-build:
	docker-compose build

compose-logs:
	docker-compose logs -f

compose-down:
	docker-compose down || true

compose-stop:
	docker-compose stop || true

compose-restart:
	docker-compose restart

compose-setup: compose-down compose-build app-setup

compose-ci-build:
	docker-compose -f docker-compose.yml build

compose-ci:
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit

env-prepare:
	cp -n .env.populate .env || true