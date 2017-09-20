require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/two_d_page"
require 'json'
require 'net/http'




describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - 2D Customizer Test: " do

	before(:all) do
		@product_page = GKProductPage.new
		@page = StockCustomizer.new
	end

	context "Verify A0 Redirect: " do
		$two_d_products.each do |product|
			it "#{product}" do
				@page.product_page(product)
				color = @product_page.selected_color
				color_name = color.attribute_value('data-color')
				color_id = @page.get_color_code(color_name,product)
				color.click
				@product_page.customize_button
				expect(@page.url).to include(color_id)
			end
		end
	end


	context "Verify 2D Data: " do
		$two_d_products.each do |product|
			it "#{product}" do
				@page.product_page(product)
				@product_page.wait_until { @product_page.customize_button? }
				@product_page.customize_button
				@page.wait_until { @page.page_load? }
				expect(@page.missing_blob.exists?).to eq(false)
				@page.wait_until { @page.silhouette.exists? }
				expect(@page.get_data(product)).to include(@page.get_back_color_ids)
				expect(@page.get_data(product)).to include(@page.get_front_color_ids)
			end
		end
	end

	context "Verify SVG:" do
		$two_d_products.each do |product|
			it "#{product}" do
				@page.goto "#{$base_url}/apps/storage/images/project/style/#{product}.svg"
				expect(@page.svg.exists?).to eq(true)
				expect{@page.raise_js_errors}.to_not raise_error
			end
		end
	end
end
