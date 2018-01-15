require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/two_d_page"

describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - 2D Customizer Test: " do

	before(:all) do
		BasePage.setup
		@product_page = GKProductPage.new
		@page = StockCustomizer.new
	end

	context "Check Missing Blob" do
		$two_d_products.each do |product|
			# it "#{product} | Blob" do
			# 	@page.goto "https://#{ENV['ENVIRONMENT']}-gkelite.pollinate.com/products/#{product}/?view=customizer-2d"
			# 	@page.wait_until { @page.svg_viewer? }
			# 	expect(@page.missing_blob.exists?).to eq(false)
			# end

			# it "#{product} | JS Error" do
			# 	puts BasePage.print_js_errors
			# end

			# it "#{product} | Customize Button" do
				@page.product_page(product)
			# 	@product_page.wait_until(3) { @product_page.customize_button? }
			# 	expect(@product_page.customize_button?).to eq(true)
			# end

			it "#{product} | Verify A0 Redirect:" do
				color = @product_page.selected_color
				color_name = color.attribute_value('data-color')
				color_id = @page.get_color_code(color_name,product)
				color.click
				expect{BasePage.raise_js_errors}.to_not raise_error
				@product_page.customize_button
				expect(@page.url).to include(color_id)
			end

			# it "#{product} | Color Options" do
			# 	@page.wait_until { @page.silhouette.exists? }
			# 	expect(@page.get_data(product)).to include(@page.get_back_color_ids)
			# 	expect(@page.get_data(product)).to include(@page.get_front_color_ids)
			# end

			# it "#{product} | SVG" do
			# 	@page.goto "#{$base_url}/apps/storage/images/project/style/#{product}.svg"
			# 	@page.wait_until(3) { @page.silhouette.exists? }
			# 	expect(@page.silhouette.exists?).to eq(true)
			# 	expect{BasePage.raise_js_errors}.to_not raise_error
			# end

			# it "#{product} | Check Page Load SVG" do
			# 	expect(@page.svg.exists?).to eq(true)
			# end
		end
	end
end
