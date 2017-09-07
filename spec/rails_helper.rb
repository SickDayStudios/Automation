require 'rspec'
# require 'simplecov'
# require 'simplecov-rcov'
require 'page-object'
require 'watir'
require 'selenium-webdriver'
require 'fuubar'
require '././lib/pages/base_page'
#require './spec/tests/webdriver_handler'
# require 'headless'
require 'openssl'
require 'rspec_junit_formatter'
require "watir-scroll"
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
# require 'rspec/rails'

ENV['RAILS_ENV'] ||= 'test'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

abort("The Rails environment is running in production mode!") if Rails.env.production?

if RSpec::Rails::FeatureCheck.can_maintain_test_schema?
# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

elsif RSpec::Rails::FeatureCheck.can_check_pending_migrations?
ActiveRecord::Migration.check_pending!
end

RSpec.configure do |config|
  config.success_color = :cyan
  config.detail_color = :red
  config.failure_color = :magenta
  config.fuubar_progress_bar_options = { :format => '|%B%p%%|> %a' }
  config.shared_context_metadata_behavior = :apply_to_host_groups


#=> Before any tests are run, this block is run
config.before(:all) do
    $driver = Watir::Browser.new ENV['BROWSER'].to_sym
    BasePage.resize_window
    BasePage.set_base_url
    BasePage.navigate_to_starting_page
  end

  config.after(:each) do |example|
    if example.exception
      $driver.screenshot.save "./reports/screenshot-#{DateTime.now.strftime("%d%b%Y-%H%M%S")}.png"
    end
  end

  config.after(:all) do
    # $headless.destroy
    BasePage.quit_webdriver
    # FileUtils.mv("./reports/test_results.xml", "./reports/results-#{DateTime.now.strftime("%d%b%Y-%H%M%S")}.xml")
    # FileUtils.mv("./reports/test_results.html", "./reports/results-#{DateTime.now.strftime("%d%b%Y-%H%M%S")}.html")
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  
end

if RSpec::Rails::FeatureCheck.has_active_record?
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true


end
  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do

  config.infer_spec_type_from_file_location!


  config.filter_rails_from_backtrace!

end