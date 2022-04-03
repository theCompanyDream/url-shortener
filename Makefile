all: dev

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
	docker-compose up -d --build

sec:
	bundle exec bundle audit --update --ignore OSVDB-108664
	bundle exec brakeman -q -w2

down: copy
	@echo "Shutting Down Dev"
	docker-compose down -v

test:
	@echo "Testing product"
	bundle exec rspec -f j -o tmp/test_results.json -f p