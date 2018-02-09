require 'rspec'
require 'page-object'
require 'watir'
require './lib/pages/base_page'
require 'openssl'
require 'rspec_junit_formatter'
require 'fileutils'
require 'json'
require 'csv'
require 'net/http'
require "json_matchers/rspec"
require 'csv'
require 'watir-nokogiri'
require 'open-uri'
require 'active_support/all'
require 'restclient'
require 'nokogiri'
require 'colorize'


RSpec.configure do |config|
	config.shared_context_metadata_behavior = :apply_to_host_groups
	
	config.before(:all) do
		$screenshotfolder = "./reports/#{Time.new.strftime("%d%b%Y-%H%M%S")}"
		$csv_file = "testResult_#{Time.new.strftime("%d%b%Y-%H%M%S")}.csv"
		unless File.directory?($screenshotfolder)
			FileUtils.mkdir_p($screenshotfolder)
		end
		args = ['--flag-switches-begin','--window-size=1920,1080','--disable-infobars','--flag-switches-end']
		# wave_path = '/Users/case/Library/Application Support/Google/Chrome/Profile 2/Profile 2/Extensions/jbbplnpkjmmeebjpijfedlgcdilocofh/1.0.9_0.crx'
		# lighthouse_path = '/Users/case/Library/Application Support/Google/Chrome/Profile 2/Profile 2/Extensions/blipmdconlkpinefehnmjammfjpmpbjk/2.8.0_0.crx'
		$driver = Watir::Browser.new :chrome , options: { args: args }
	end

	config.after(:each) do |example|
		if example.exception
			$driver.screenshot.save "#{$screenshotfolder}/fail-#{Time.new.strftime("%d%b%Y-%H%M%S")}.png"
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