describe "Performance Test" do 

	it "#{ENV['BROWSER'].upcase} | #{ENV['ENVIRONMENT'].upcase} | #{handle.upcase} | " do
		10.times do 
			$driver.goto("#{url}")
			BasePage.performance_check
		end
	end
end