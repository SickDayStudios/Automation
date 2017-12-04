require './lib/pages/preview/preview_base_page'


describe ":: Product Preview Test ::" do

	before(:all) do
		BasePage.set_base_url
		BasePage.navigate_to_starting_page
		@page = PreviewBasePage.new
		@arr = Array.new
		@page.collect_links.each do |link|
			if link.include? ("extra" || "test" || "dummy" || "asset" || "scene.json" || "firstset")
			else
				@arr.push(link)
			end
		end
	end


	it ":: Product Preview Test Complete ::" do
		aggregate_failures "Page Errors" do
			@arr.each do |href|
				puts ""
				puts "- Testing Asset URL: #{href}"
				@page.goto ("#{href}")
				@page.wait_until { @page.shader_properties_element.exists? && @page.json_manifest_element.exists? }
				sleep 10
				BasePage.print_js_errors
				expect(BasePage.raise_js_errors).not_to raise_error
			end
		end
	end
end