install:
	npm install

start:
	npm start

test:
	npm -s test

compose:
	docker-compose up --abort-on-container-exit

build:
	docker build -f Dockerfile.production -t feycot/devops-for-programmers-project-lvl1 .

push-image:
	docker push feycot/devops-for-programmers-project-lvl1

docker-start:
	docker run -e NODOS_HOST=0.0.0.0 -e NODOS_DB_TYPE=sqljs -p 8080:8080 feycot/devops-for-programmers-project-lvl1

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

app-setup:
	docker-compose run make install

compose-ci: compose-ci-build compose-ci-test

compose-ci-build:
	docker-compose --file docker-compose.yml build

compose-ci-test:
	docker-compose --file docker-compose.yml up --abort-on-container-exit

compose-bash:
	docker-compose run --rm app bash

env-prepare:
	cp -n .env.example .env || true
