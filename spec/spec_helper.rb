require 'rspec'
require 'page-object'
require "appium_lib"
require 'watir'
require './lib/pages/base_page'
require 'openssl'
require 'rspec_junit_formatter'
require "watir-scroll"
require 'fileutils'
require 'json'
require 'net/http'
require 'json-schema'
require 'json-schema-rspec'
require "json_matchers/rspec"


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

@screenshotfolder = "./reports/#{Time.new.strftime("%d%b%Y-%H%M%S")}"
unless File.directory?(@screenshotfolder)
  FileUtils.mkdir_p(@screenshotfolder)
end

RSpec.configure do |config|
    config.success_color = :cyan
    config.detail_color = :red
    config.failure_color = :magenta
    config.shared_context_metadata_behavior = :apply_to_host_groups

#=> Before any tests are run, this block is run
config.before(:all) do
    $driver = Watir::Browser.new ENV['BROWSER'].to_sym
end

# config.before(:each) do |example|
#     caps = {
#         caps: {
#             platformVersion: "#{ENV['platformVersion']}",
#             deviceName: "#{ENV['deviceName']}",
#             platformName: "#{ENV['platformName']}",
#             app: "#{ENV['app']}",
#             deviceOrientation: 'portrait',
#         }
#     }
#     @driver = Appium::Driver.new(caps)
#     @driver.start_driver
# end

config.after(:each) do |example|
    if example.exception
        $driver.screenshot.save "./reports/#{@screenshotfolder}/fail-#{DateTime.now.strftime('%d%b%Y-%H%M%S')}.png"
    end
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