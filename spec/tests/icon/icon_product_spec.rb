require "./lib/pages/icon/icon_base_page"

describe "UA Icon Schema Test" do 

	before(:all) do
		BasePage.set_user
    	BasePage.set_base_url
    	
		@page = IconBasePage.new
		@readable_id = @page.recipe_id_list
	end

	context "API Call: " do
		it "UA Icon Schema Test Complete" do
			@readable_id.each do |id|
				url = "https://staging.spectrumcustomizer.com/api/recipesets/readable/#{id}"
				uri = URI(url)
				response = Net::HTTP.get(uri)
				specs = JSON.parse(response)
				JSON::Validator.fully_validate('./lib/config/eb_product_schema.json', specs)
			end
		end
	end
end