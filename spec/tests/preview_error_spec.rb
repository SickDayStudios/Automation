require './lib/pages/preview/preview_base_page'


describe "Product Preview Test: " do

	before(:all) do
		BasePage.navigate_to_starting_page
		@page = PreviewBasePage.new
	end


	it "TEST COMPLETE" do
		@arr = Array.new
		@page.collect_links.each do |link|
			url = link.href
			@arr.push(url)
		end
		@arr.each do |href|
			puts "- Testing Page: #{href}"
			@page.goto ("#{href}")
			begin @page.wait_until { @page.asset_loaded? }
			rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
				false
				BasePage.print_js_errors
			end
			BasePage.print_js_errors
		end
	end
end