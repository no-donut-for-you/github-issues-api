source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'puma', '~> 4.1'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'faraday', '>=1.1.0'
gem 'faraday_middleware', '>=1.0.0'
gem 'rack-cors'

group :development, :test do
  gem 'rspec-rails'
  gem 'figaro'
  gem 'vcr'
  gem 'webmock'
  gem 'pry'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data'
