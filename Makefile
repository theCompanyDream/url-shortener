all: dev prod clean prod-down dev-down

clean:
	@echo "cleaning volumes"
	docker volume rm $(docker volume ls -q)

copy:

ifeq (,$(wildcard ./.env))
	@echo "Copying .env file"
	cp .env.example .env
endif

dev: copy
	@echo "Starting Dev"
	docker-compose up -d

dev-down: copy
	@echo "Shutting Down Dev"
	docker-compose down -v

prod: copy
	@echo "Deploying tbrantlyii.me"
	docker-compose -f docker-compose.prod.yml up -d

prod-down:
	docker-compose -f docker-compose.prod.yml down -v