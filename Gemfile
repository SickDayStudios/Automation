source 'https://rubygems.org'

git_source(:bitbucket) do |repo_name|
	repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
	"https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'rspec'
  gem 'page-object'
  gem 'watir'
  gem 'rake'
  gem 'rest-client'
  # gem "simplecov"
  # gem "simplecov-rcov"
  gem "ci_reporter_rspec"
  gem "rspec_junit_formatter"
  gem 'coderay'
  # gem 'json-schema-rspec'
  gem 'json_matchers'
  gem 'watir-nokogiri'
  gem 'activesupport'
  # gem 'json-schema'
  # gem 'appium_lib'
  # gem 'appium_console'
  # gem 'nyan-cat-formatter'
  gem 'colorize'
  gem 'parallel_tests'
  gem 'rubyzip'
  gem 'pry'
  gem 'chunky_png'
  gem 'rmagick'
  gem 'watir-webdriver-performance'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]