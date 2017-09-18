require './lib/pages/preview/preview_base_page'


describe "Preview Page Error Test" do

	before(:all) do
		BasePage.navigate_to_starting_page
		@page = PreviewBasePage.new
	end


	it "Navigate to each Product Preview:" do
		@page.product_links.each do |id|
			puts id.link.text
			id.link.click
			@page.wait_until(60) { @page.asset_load? }
			BasePage.navigate_to_starting_page
		end
	end
end