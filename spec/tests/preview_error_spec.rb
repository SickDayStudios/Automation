require './lib/pages/preview/preview_base_page'


describe "Product Preview Test: " do

	before(:all) do
		BasePage.set_base_url
    	BasePage.resize_window
    	BasePage.navigate_to_starting_page
		@page = PreviewBasePage.new
		@arr = Array.new
		@page.collect_links.each do |link|
			if $asset_list.include? link.text
				@arr.push(link.href)
			end
		end
	end


	it "Text Complete" do
		@arr.each do |href|
			puts "- Testing Asset URL: #{href}"
			@page.goto ("#{href}")
			begin @page.wait_until { @page.shader_properties_element.exists? && @page.json_manifest_element.exists? }
				sleep 10
			rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
				false
				BasePage.print_js_errors
			end
			BasePage.print_js_errors
		end
	end
end