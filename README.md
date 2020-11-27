# github-issues-api

The **github-issues-api** is a simple API to get issues from a Github's repository.

### Up and running

#### Installing all dependencies:
```bash
$ bundle install
```

#### Starting server:
```bash
$ rails s
```

#### Running tests:
```bash
$ rspec
```

```bash
=> Booting Puma
=> Rails 6.0.3.4 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.6 (ruby 2.6.0-p0), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://127.0.0.1:3000
* Listening on tcp://[::1]:3000
Use Ctrl-C to stop
```

## Using Docker

First, you need to install [Docker](https://docs.docker.com).

### Up and running

#### Starting server:
```bash
$ make run-app
```

or 

```bash
$ docker-compose up github-issues-api
```

```bash
github-issues-api    | => Booting Puma
github-issues-api    | => Rails 6.0.3.4 application starting in development
github-issues-api    | => Run `rails server --help` for more startup options
github-issues-api    | Puma starting in single mode...
github-issues-api    | * Version 4.3.6 (ruby 2.6.0-p0), codename: Mysterious Traveller
github-issues-api    | * Min threads: 5, max threads: 5
github-issues-api    | * Environment: development
github-issues-api    | * Listening on tcp://0.0.0.0:3000
```

#### Running tests:
```bash
$ make run-tests
```

or

```bash
$ docker-compose run github-issues-api rspec
```

### API usage:

GET issues:

```curl
curl --location --request GET 'http://localhost:3000/api/v1/issues/rails/rails?assignee=none&direction=desc&labels=activerecord&since=2020-11-24T14:01:58%2B00:00&sort=comments&state=open&per_page=1&page=2'
```
