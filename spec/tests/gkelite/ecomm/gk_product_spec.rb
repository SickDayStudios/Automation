require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/helpers/gkelite/gk_cart_lightbox"
require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/asset_api_page"


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase}:#{ENV['USER_TYPE'].upcase} - GK Product GUI Test:" do

	before(:all) do
		@arr = Array.new
		@page = GKProductPage.new
		@customizer = CustomizerPage.new
		BasePage.set_base_url
		BasePage.navigate_to_starting_page
		$gk_scene_files.each do  |scene|
			AssetAPI.scene_productoptions_keys(scene).each do |handle|
				@arr.push(handle.scan(/(?=\w*[0-9])\w*/))
			end
		end
		@product_handles = @arr.flatten
	end

	it "Verify Front End GUI" do
		aggregate_failures "Product Failure: " do
			@product_handles.each do |id|
				aggregate_failures "#{id}" do
					puts " - Testing: #{id}"
					@page.product_page(id)
					if @page.four_oh_four?
						puts "404 Error"
					else
						@page.wait_while { @page.placeholder_image? }
						expect(@page.product_accordions_element.present?).to eq(true)
						expect(@page.product_info_element.present?).to eq(true)
						expect(@page.price).to include('$')
						expect(@page.selected_color_element.present?).to eq(true)
						expect(@page.color_picker_element.present?).to eq(true)
						expect(@page.size_dropdown_element.present?).to eq(true)
						expect(@page.fit_size_info_element.present?).to eq(true)
						expect(@page.add_to_cart_element.present?).to eq(true)
						expect(@page.similar_recent_products_element.present?).to eq(true)
						expect(@page.product_thumbnails_element.present?).to eq(true)
						@page.color_picker_element.buttons.to_a.each do |x|
							x.click
							@page.wait_until { @page.product_image? }
							expect(@page.product_image_element.present?).to eq(true)
						end
						expect{BasePage.raise_js_errors}.to_not raise_error
						puts BasePage.print_js_errors
						if @page.customize_button?
							@page.customize_button
							@page.wait_until { @customizer.page_load? }
							expect(@customizer.selected_style?).to eq(true)
							expect{BasePage.raise_js_errors}.to_not raise_error
							puts BasePage.print_js_errors
						end
					end
				end
			end
		end
	end
end