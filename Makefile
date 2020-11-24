run-app:
	docker-compose up github-rails-client

run-build:
	docker-compose build

run-tests: 
	docker-compose exec github-rails-client rspec
