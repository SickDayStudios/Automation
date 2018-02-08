require "./lib/pages/bmk/bmk_base_page"

describe "BMK Magento Price Test" do

	before(:all) do
		@browser = BMKBasePage.new
		@hash = Hash.new
	end

	100.times do 
		it "Compare Prices" do
			prices = @browser.check_cart_price
			expect(prices[1]).to include(prices[0])
			expect(prices[2]).to include(prices[0])
			expect(prices[1]).to include(prices[2])
		end
	end

end