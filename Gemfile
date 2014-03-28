source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.1'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise', '3.0.0.rc'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
	gem 'pg'
	gem 'rails_12factor'
end

group :development, :test do
  	gem 'rspec-rails', '~> 2.0'
  	gem 'sqlite3', '1.3.8'
end

group :test do
  	gem 'capybara', '~> 2.1.0'
  	gem 'shoulda-matchers', '~> 2.4.0'
end