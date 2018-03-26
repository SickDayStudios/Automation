class BasePage
	include PageObject

	def initialize
		super($driver)
	end

	def api_setup(url)
		return JSON.parse(RestClient.get(url))
	end

	def self.set_device_to(device)
		case device.to_sym
		when :ipad then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :ipad, orientation: :landscape)
		when :iphone then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone, orientation: :landscape)
		when :phone then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :android_phone, orientation: :landscape)
		when :tablet then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :android_tablet, orientation: :landscape)
		end
		args = ['--flag-switches-begin','--use-mobile-user-agent','--window-position=0,0','--disable-infobars','--flag-switches-end']
		$driver = Watir::Browser.new user, options: { args: args }
	end

	def self.performance_check
	    puts ("Response time: #{$driver.performance.summary[:response_time]}ms")
	end

	def self.extract_zip(file)
		Zip::File.open('./reports/*.zip') do |zip_file|
			zip_file.each do |f|
				fpath = File.join($screenshotfolder, f.name)
				zip_file.extract(f, fpath) unless File.exist?(fpath)
			end
		end
	end

	def self.download_image(src)
		File.open($screenshotfolder, 'wb') do |f|
			f.write open(src).read
		end
	end

	def wait_or_rescue(arg)
		begin
			self.wait_until { arg }
		rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
			BasePage.print_js_errors
		end
	end

	def self.print_js_errors
		log = $driver.driver.manage.logs.get(:browser)
		errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
		if errors.count > 0
			javascript_errors = errors.map(&:message).join("\n")
			puts "PageError:\n#{javascript_errors}"
		end
	end

	def self.print_js_warnings
		log = $driver.driver.manage.logs.get(:browser)
		errors = log.select{ |entry| entry.level.eql? 'WARNING' }
		if errors.count > 0
			javascript_errors = errors.map(&:message).join("\n\n")
			puts "\nPageError:\n#{javascript_errors}"
		end
	end

	def self.raise_js_errors
		log = $driver.driver.manage.logs.get(:browser)
		errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
		if errors.count > 0
			javascript_errors = errors.map(&:message).join("\n")
			raise javascript_errors
		end
	end

	def self.on_fail(example)
		if example.exception
			$driver.screenshot.save "#{@screenshotfolder}/fail-#{DateTime.now.strftime('%d%b%Y-%H%M%S')}.png"
		end
		self.print_js_errors
	end

	def self.collect_links
		links = $driver.links.collect
		results = links.reject { |r| r.include?("extra") }
		return results
	end

	def self.collect_links_href
		hrefs = $driver.links.collect(&:href)
		results = hrefs.reject { |r| r.include?("extra") }
		return results
	end

	def self.collect_links_text
		text = $driver.links.collect(&:text)
		results = text.reject { |r| r.include?("extra") }
		return results
	end

	def self.navigate_to_starting_page
		$driver.goto $base_url
	end

	def self.quit_webdriver
		$driver.quit
	end

	def self.setup
		BasePage.set_user
		BasePage.set_base_url
		BasePage.navigate_to_starting_page
	end

	def self.create_csv
		CSV.open("#{$screenshotfolder}/#{$csv_file}", "wb") do |csv|
			csv << ["Summary","Issue Type","Assignee","Status","Priority","Reporter","Creator","Due Date","Description","Custom field (Epic Link)","Outward Issue Link"]
		end
	end

	def self.update_csv(summary, description)
		CSV.open("#{$screenshotfolder}/#{$csv_file}", "a+") do |csv| 
			csv << ["#{summary}","Task","cwilliams","To Do","Normal","cwilliams","cwilliams","","#{description}","",""]
		end
	end


	def self.set_user
		case ENV['SITE'].to_sym
		when :'gk-elite'
			case ENV['ENVIRONMENT'].to_sym
			when :staging
				case ENV['USER_TYPE'].to_sym
				when :consumer then $username = 'pollinatetest@gmail.com' and $password = 'iamquality'
				when :dealer then $username = 'pollinatetest+gkdealer@gmail.com' and $password = 'IamQuality!'
				when :distributor then $username = 'pollinatetest+gkdistributor@gmail.com' and $password = 'IamQuality!'
				when :salesrep then $username = 'pollinatetest+gksalesrep@gmail.com' and $password = 'IamQuality!'
				when :teamlead then $username = 'pollinatetest+gkteamdealer@gmail.com' and $password = 'IamQuality!'
				end
			when :prod
				case ENV['USER_TYPE'].to_sym
				when :consumer then $username = 'pollinatetest+gkconsumer@gmail.com' and $password = 'IamQuality!'
				when :dealer then $username = 'pollinatetest+gkdealer@gmail.com' and $password = 'IamQuality!'
				when :distributor then $username = 'pollinatetest+gkdistributor@gmail.com' and $password = 'IamQuality!'
				when :salesrep then $username = 'pollinatetest+gksalesrep@gmail.com' and $password = 'IamQuality!'
				when :teamlead then $username = 'pollinatetest+gkteamdealer@gmail.com' and $password = 'IamQuality!'
				end
			end
		end
	end

	def self.set_base_url
		case ENV['SITE'].to_sym
		when :benchmade 
			case ENV['ENVIRONMENT']
			when :test then $base_url = 'http://madetoordertest.azureedge.net/benchmade' and $price_url = 'http://test.spectrumcustomizer.com/api/recipesets/pricing/' and $spec_url = 'http://test.spectrumcustomizer.com/benchmade/specification/preview/'
			when :staging then $base_url = 'http://madetoorderstaging.azureedge.net/benchmade' and $price_url = 'http://staging.spectrumcustomizer.com/api/recipesets/pricing/' and $spec_url = 'http://staging.spectrumcustomizer.com/benchmade/specification/preview/'
			when :prod then $base_url = 'http://madetoorder.azureedge.net/benchmade' and $price_url = 'http://api.spectrumcustomizer.com/api/recipesets/pricing/' and $spec_url = 'http://api.spectrumcustomizer.com/benchmade/specification/preview/'
			end
		when :camelbak then $base_url = 'http://madetoorder.azureedge.net/camelbak/frontend/'
		when :customizer
			case ENV['ENVIRONMENT'].to_sym
			when :test then $base_url = 'http://demo.madetoordercustomizer.com/gk-elite/test/frontend/index.html#/products/'
			when :staging then $base_url = 'http://demo.madetoordercustomizer.com/gk-elite/staging/frontend/index.html#/products/'
			when :prod then $base_url = 'http://demo.madetoordercustomizer.com/gk-elite/production/frontend/index.html#/products/'
			end
		when :'gk-elite'
			case ENV['ENVIRONMENT'].to_sym
			when :dev then $base_url = 'https://dev-gkelite.pollinate.com'
			when :test then $base_url = 'https://test-gkelite.pollinate.com'
			when :staging then $base_url = 'https://staging-gkelite.pollinate.com'
			when :prod then $base_url = 'https://www.gkelite.com'
			end
		when :'ua-icon'
			case ENV['ENVIRONMENT']
			when :staging then $base_url = 'https://staging.underarmour.com'
			when :prod then $base_url = 'https://www.underarmour.com/en-us/ua-icon-customized-shoes'
			end
		when :admin
			case ENV['ENVIRONMENT']
			when :dev then $base_url = 'https://dev.spectrumcustomizer.com/admin/' and $username = 'test_sa' and $password = 'SuperUser#1'
			when :staging then $base_url = 'http://demo.spectrumcustomizer.com/admin/' and $username = 'test_sa' and $password = 'SuperUser#1'
			when :prod then $base_url = 'http://demo.spectrumcustomizer.com/admin/' and $username = 'test_sa' and $password = 'SuperUser#1'
			end
		when :eto then $base_url = "https://forms.energytrust.org/esf"
		when :'under-armour'
			case ENV['ENVIRONMENT'].to_sym
			when :test then $base_url =  'http://demo.madetoordercustomizer.com/under-armour/test/uau/frontend/index.html#/materialIds/'
			when :staging then $base_url = 'http://demo.madetoordercustomizer.com/under-armour/staging/uau/frontend/index.html#/materialIds/'
			when :prod then $base_url = 'http://demo.madetoordercustomizer.com/under-armour/production/uau/frontend/index.html#/materialIds/'
			end
		when :preview then $base_url = 'http://preview.madetoordercustomizer.com/'
		when :'eddie-bauer'
			case ENV['ENVIRONMENT'].to_sym
			when :prod then $base_url = 'http://www.eddiebauer.com/product/'
			when :staging then $base_url = 'http://staging.eddiebauer.com/product/'
			end
		end
	end
end