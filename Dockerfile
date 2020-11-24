FROM ruby:2.7-alpine

WORKDIR /app

RUN apk --update add build-base nodejs

COPY Gemfile .

RUN bundle install

COPY . .
