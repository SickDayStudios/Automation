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




# GET /webgl/client/babolat/bab-pro-aero-racket-extra/models/pollinate.obj HTTP/1.1
# Host: madetoordertest.blob.core.windows.net
# Connection: keep-alive
# Origin: http://preview.madetoordercustomizer.com
# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36
# Accept: */*
# Referer: http://preview.madetoordercustomizer.com/Home/View?sceneUrl=http%3A%2F%2Fmadetoordertest.blob.core.windows.net%2Fwebgl%2Fclient%2Fbabolat%2Fbab-pro-aero-racket-extra%2Fscene.json
# Accept-Encoding: gzip, deflate
# Accept-Language: en-US,en;q=0.8

