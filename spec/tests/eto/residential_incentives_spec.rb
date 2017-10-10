require 'lib/pages/residential_incentives_page'

describe "Energy Trust Residential Incentives" do

	before(:all) do
		BasePage.set_base_url
		BasePage.navigate_to_starting_page
		@page = ResidentialIncentives.new
	end

	it "Complete Form" do
	end
	
end