require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Performance Test" do 

	before(:all) do
		# BasePage.set_device_to('iphone')
		@page = IconCustomizer.new
	end

	$icon_pid.each do |handle|
		it "#{ENV['BROWSER'].upcase} | #{ENV['ENVIRONMENT'].upcase} | #{handle.upcase} | " do
			10.times do 
				case ENV['ENVIRONMENT'].to_sym
					when :staging then $driver.goto("https://staging.underarmour.com/en-us/#{handle}")
					when :prod then $driver.goto("https://www.underarmour.com/en-us/#{handle}")
				end
				@page.wait_while { @page.loading_bar_element.visible? }
				@page.wait_until { @page.pattern_options_element.visible? }
				BasePage.performance_check
			end
		end
	end
end