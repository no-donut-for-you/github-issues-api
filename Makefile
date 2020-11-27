run-app:
	docker-compose up github-issues-api

run-build:
	docker-compose build

run-tests:
	docker-compose run github-issues-api rspec

