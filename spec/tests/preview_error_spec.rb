require './lib/pages/preview/preview_base_page'
require './lib/pages/asset_api_page'
require './lib/pages/base_page'


describe ":: Product Preview Test ::" do

	before(:all) do 
		@asset_list = AssetAPI.get_product_handles
		@links = Array.new
		@page = PreviewBasePage.new
		@page.goto "http://preview.madetoordercustomizer.com/"
		@href = BasePage.collect_links_href
		@text = BasePage.collect_links_text
		@href.zip(@text).each do |href, text|
			if @asset_list.include?(text)
				@links.push(href)
			end
		end
	end

	it ":: Product Preview Test Complete ::" do
		aggregate_failures "PageError Spec :: " do
			@links.each do |url|
				puts "- Testing: #{url}"
				aggregate_failures "Failed: #{url}" do
					@page.goto "#{url}"
					@page.wait_until { @page.shader_properties_element.exists? && @page.json_manifest_element.exists? }
					sleep 10
					puts BasePage.print_js_errors
				end
			end
		end
	end
end