FROM ruby:2.6.0-alpine

WORKDIR /app

RUN apk --update add build-base nodejs

COPY Gemfile .

RUN bundle install

COPY . .
