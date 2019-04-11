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
require 'json_matchers/rspec'
require 'watir-nokogiri'
require 'open-uri'
require 'active_support/all'
require 'restclient'
require 'colorize'
require 'zip'
require 'base64'
require 'pry'
require 'chunky_png'
require 'watir-webdriver-performance'
require 'watir-ng'
require 'axe/rspec'

RSpec.configure do |config|

	# config.shared_context_metadata_behavior = :apply_to_host_groups
	
	# config.before(:all) do

		# $screenshotfolder = "reports/#{Time.new.strftime("%d%b%Y-%H%M%S")}"

		# $csv_file = "testResult_#{Time.new.strftime("%d%b%Y-%H%M%S")}.csv"

		# unless File.directory?($screenshotfolder)
		# 	FileUtils.mkdir_p($screenshotfolder)
		# end

		# args = ['--window-size=1920,1080','--window-position=0,0','--disable-infobars','--disable-gpu-watchdog','--disable-background-timer-throttling']
		
		
		# $driver = Watir::Browser.new :chrome, options: { args: args }
		# WatirNg.patch!
	# end

	# config.after(:each) do |example|

	# 	if example.exception
	# 		$driver.screenshot.save "#{@screenshotfolder}/fail-#{DateTime.now.strftime('%d%b%Y-%H%M%S')}.png"
	# 	end
	# 	self.print_js_errors

	# end

	# config.after(:all) do

	# 	BasePage.quit_webdriver

	# end


	# config.expect_with :rspec do |expectations|

	# 	expectations.include_chain_clauses_in_custom_matcher_descriptions = true

	# end

	# config.mock_with :rspec do |mocks|

	# 	mocks.verify_partial_doubles = true

	# end
end


  
