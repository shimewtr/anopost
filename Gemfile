# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.1.6"
gem "pg"
gem "puma", "~> 5.6"
gem "sass-rails", "~> 6"
gem "webpacker", "~> 5.4"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.11"
gem "bootsnap", ">= 1.4.2", require: false
gem "dotenv-rails"
gem "slim-rails"
gem "html2slim"
gem "font-awesome-sass", "~> 5.15.1"
gem "bcrypt", "~> 3.1.18"
gem "slack-notifier"
gem "meta-tags"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.8"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "slim_lint"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
