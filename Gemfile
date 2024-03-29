source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'pry'
gem 'faker'
gem 'pagy', '~> 4.11'
gem 'exception_notification', '~> 4.4', '>= 4.4.3'
gem 'chartkick', '~> 4.0', '>= 4.0.5'
gem 'active_storage_validations'

gem 'bootstrap', '~> 4.1', '>= 4.1.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'jquery-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'simple_form'
gem 'ransack'
gem 'public_activity', '~> 1.6', '>= 1.6.4'
gem 'devise'
gem "recaptcha"
gem 'ruby-graphviz'
gem 'ranked-model', '~> 0.4.7'
gem 'groupdate'
gem 'actiontext', '~> 6.1', '>= 6.1.4.1'
gem 'omniauth-google-oauth2'
gem 'rolify', '~> 6.0'
gem 'aws-sdk-s3', require: false
gem 'pundit', '~> 2.1', '>= 2.1.1'
gem 'friendly_id', '~> 5.4', '>= 5.4.2'
gem 'rails-erd', group: :development
# For certification
gem 'wicked_pdf', '~> 2.1'
gem 'wkhtmltopdf-binary', '~> 0.12.6.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
 gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
