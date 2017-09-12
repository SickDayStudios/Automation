require 'rspec'
# require 'rspec-rails'
require 'simplecov'
require 'simplecov-rcov'
require 'page-object'
require 'watir'
require 'selenium-webdriver'
require 'fuubar'
require './lib/pages/base_page'
require 'openssl'
require 'rspec_junit_formatter'
require "watir-scroll"
require 'fileutils'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
# $out_file = File.new("reports/#{Time.now.strftime('%h-%e-%Y %H%M')}.json", 'w')

# def $stdout.write string
#   $out_file.write string
#   super
# end

screenshotfolder = "reports/#{Time.new.strftime("%d%b%Y-%H%M%S")}"
unless File.directory?(screenshotfolder)
  FileUtils.mkdir_p(screenshotfolder)
end

RSpec.configure do |config|
  config.success_color = :cyan
  config.detail_color = :red
  config.failure_color = :magenta
  config.fuubar_progress_bar_options = { :format => '|%B%p%%|> %a' }
  config.shared_context_metadata_behavior = :apply_to_host_groups


#=> Before any tests are run, this block is run
  config.before(:all) do
    @screenshotfolder = screenshotfolder
    $driver = Watir::Browser.new ENV['BROWSER'].to_sym
    BasePage.resize_window
    BasePage.set_base_url
    BasePage.set_user
    BasePage.navigate_to_starting_page
  end

  config.after(:each) do |example|
    if example.exception
      $driver.screenshot.save "#{@screenshotfolder}/fail-#{DateTime.now.strftime('%d%b%Y-%H%M%S')}.png"
    end
  end

  config.after(:all) do
    # $headless.destroy
    BasePage.quit_webdriver
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  
end