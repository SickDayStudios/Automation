require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Performance Test" do 

	before(:all) do
		# BasePage.set_device_to('iphone')
	end

		it "#{ENV['BROWSER'].upcase} | #{ENV['ENVIRONMENT'].upcase} | #{handle.upcase} | " do
			10.times do 
				$driver.goto("#{url}")
				BasePage.performance_check
			end
		end
	end
end