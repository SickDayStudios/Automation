require 'rspec'
require 'page-object'
# require "appium_lib"
require 'watir'
require './lib/pages/base_page'
require 'openssl'
require 'rspec_junit_formatter'
require 'fileutils'
require 'json'
require 'csv'
require 'net/http'
# require 'json-schema'
# require 'json-schema-rspec'
require "json_matchers/rspec"
require 'csv'
require "watir-scroll"
require 'watir-nokogiri'
require 'open-uri'
require 'active_support/all'
# require 'webdriver-user-agent'
# require 'watir-webdriver-performance'


RSpec.configure do |config|
	config.shared_context_metadata_behavior = :apply_to_host_groups

	#=> Before any tests are run, this block is run
	config.before(:all) do
		OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
		$screenshotfolder = "./reports/#{Time.new.strftime("%d%b%Y-%H%M%S")}"
		$csv_file = "testResult_#{Time.new.strftime("%d%b%Y-%H%M%S")}.csv"
		unless File.directory?($screenshotfolder)
			FileUtils.mkdir_p($screenshotfolder)
		end
		args = ['--user-data-dir=/Users/case/Library/Application Support/Google/Chrome/Profile 2',
				'--disable-infobars',
				'--start-maximized',
				"--enable-precise-memory-info"]

		wave_path = '/Users/case/Library/Application Support/Google/Chrome/Profile 2/Profile 2/Extensions/jbbplnpkjmmeebjpijfedlgcdilocofh/1.0.9_0.crx'
		lighthouse_path = '/Users/case/Library/Application Support/Google/Chrome/Profile 2/Profile 2/Extensions/blipmdconlkpinefehnmjammfjpmpbjk/2.8.0_0.crx'
		$driver = Watir::Browser.new :chrome, options: { extensions: [wave_path, lighthouse_path], args: args }
	end

			# --disable-background-networking --disable-browser-side-navigation --disable-client-side-phishing-detection --disable-default-apps --disable-hang-monitor --disable-infobars --disable-popup-blocking --disable-prompt-on-repost --disable-sync --disable-web-resources --enable-automation --enable-logging --force-fieldtrials=SiteIsolationExtensions/Control --ignore-certificate-errors --load-extension=/var/folders/_k/ty0r3fks0b9dkvhzf2nl6gmr0000gn/T/.org.chromium.Chromium.HAbI3g/extension_mjlcfgnaichicdbekfellhbjcgohcgpp,/var/folders/_k/ty0r3fks0b9dkvhzf2nl6gmr0000gn/T/.org.chromium.Chromium.HAbI3g/extension_jkdfmgpiaagenbddajlbonfpgoajanmm,/var/folders/_k/ty0r3fks0b9dkvhzf2nl6gmr0000gn/T/.org.chromium.Chromium.HAbI3g/internal --log-level=0 --metrics-recording-only --no-first-run --password-store=basic --remote-debugging-port=12629 --safebrowsing-disable-auto-update --start-maximized --test-type=webdriver --use-mock-keychain --user-data-dir=/Users/case/Library/Application Support/Google/Chrome --flag-switches-begin --flag-switches-end

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