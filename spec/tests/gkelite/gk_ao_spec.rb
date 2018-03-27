require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/asset_api_page"
require "./lib/pages/icon/icon_base_page"


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK A0 Redirect Test: " do

	before(:all) do
		puts "#{Time.now.strftime('		%I:%M:%S%p')}".blue
		@pdp = GKProductPage.new
	end

	after(:each) do
		puts "#{Time.now.strftime('		%I:%M:%S%p')}".blue
	end


	it "Verify A0#'s" do
		aggregate_failures "" do
			@pdp.check_ao
		end
	end
end
