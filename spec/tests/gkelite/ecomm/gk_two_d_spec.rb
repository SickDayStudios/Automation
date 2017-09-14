require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/two_d_page"
require 'json'
require 'net/http'




describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - 2D Customizer Test: " do

	before(:all) do
		@product_page = GKProductPage.new
		@page = StockCustomizer.new
	end

	context "Verify Color Redirect:" do
		$two_d_products.each do |product|
			it "#{product}" do
				@page.product_page(product)
				color = @product_page.selected_color
				color_name = color.attribute_value('data-color')
				puts color_name
				color_id = @page.get_color_code(color_name,product)
				puts color_id
				color.click
				@product_page.customize_button
				expect(@page.url).to include(color_id)
			end
		end
	end


	context "Verify PP Colors Match 2D Data" do
		$two_d_products.each do |product|
			it "" do
				@page.product_page(product)
				@product_page.customize_button
				expect(@page.get_data(product)).to include(@page.get_back_color_ids)
				expect(@page.get_data(product)).to include(@page.get_front_color_ids)
			end
		end
	end
end