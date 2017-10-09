require "./lib/pages/eb/eb_base_page"

describe "Eddie Bauer Test" do

	before(:all) do
		# BasePage.setup
		# @page = EBBasePage.new
	end

	context "Swatches" do

		# it "Test SideNav Text" do
		# 	expect(@page.hood_label).to include("HOOD")
		# end

		it "API CALL" do
			url = "https://staging.spectrumcustomizer.com/api/recipesets/readable/TQ2F6NWT"
			uri = URI(url)
			response = Net::HTTP.get(uri)
			specs = JSON.parse(response)
			puts specs
		end
	end
end