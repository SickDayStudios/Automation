require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Performance Test" do 

	before(:all) do
	end

	$icon_handles.each do |handle|
		it "#{ENV['ENVIRONMENT']} | handle" do
			10.times do 
				$driver.goto("https://staging.underarmour.com/en-us/#{handle}")
				@page.wait_while { @page.loading_bar_element.visible? }
				@page.wait_until { @page.pattern_options_element.visible}
				BasePage.performance_check
			end
		end
	end
end