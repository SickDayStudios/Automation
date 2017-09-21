require './lib/pages/preview/preview_base_page'


describe "Product Preview Test: " do

	before(:all) do
		BasePage.navigate_to_starting_page
		@page = PreviewBasePage.new
	end


	it "**Test Complete**" do
		@page.collect_links.each do |id|
			puts "- Testing Asset: #{id.text}"
			id.click
			sleep 3
			BasePage.print_js_errors
			BasePage.navigate_to_starting_page
		end
	end
end