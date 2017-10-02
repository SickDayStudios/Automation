require 'rspec'
require 'page-object'
require 'watir'
require './lib/pages/base_page'
require 'openssl'
require 'rspec_junit_formatter'
require "watir-scroll"
require 'fileutils'


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

screenshotfolder = "reports/#{Time.new.strftime("%d%b%Y-%H%M%S")}"
unless File.directory?(screenshotfolder)
  FileUtils.mkdir_p(screenshotfolder)
end

RSpec.configure do |config|
  config.success_color = :cyan
  config.detail_color = :red
  config.failure_color = :magenta
  config.shared_context_metadata_behavior = :apply_to_host_groups

#=> Before any tests are run, this block is run
  config.before(:all) do
    $driver = Watir::Browser.new ENV['BROWSER'].to_sym
    @screenshotfolder = screenshotfolder
    BasePage.resize_window
    BasePage.set_base_url
    BasePage.set_user
  end

  config.after(:each) do |example|
    BasePage.on_fail(example)
  end

  config.after(:all) do
    BasePage.quit_webdriver
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  
end