require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/helpers/gkelite/gk_cart_lightbox"
require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/asset_api_page"
require "./lib/pages/gkelite/two_d_page"


describe "#{ENV['SITE'].upcase} | #{ENV['ENVIRONMENT'].upcase} | #{ENV['BROWSER'].upcase} | #{ENV['USER_TYPE'].upcase} - GK Product GUI Test" do

	before(:all) do
		@arr = Array.new
		@page = GKProductPage.new
		@customizer = CustomizerPage.new
		BasePage.set_base_url
		BasePage.navigate_to_starting_page
	end


	$gk_assets.each do |id|
		it "-------------------------------------------" do
			puts " - Verifying Asset: #{id}"
			@page.product_page(id)
			if @page.four_oh_four?
				puts "Asset: #{id} | PDP | PageError :: 404 Missing Product From Product Feed"
			else
				@page.wait_until { @page.product_info_element.visible? }
				if @page.product_accordions_element.present? == false
					puts "Asset: #{id} | PDP | Missing Product Detail Accordians"
				end
				if @page.product_info_element.present? == false
					puts "Asset: #{id} | PDP | Missing Product Info"
				end
				if @page.price_element.text.nil? == true
					puts "Asset: #{id} | PDP | Missing Price"
				end
				if @page.selected_color_element.present? == false
					puts "Asset: #{id} | PDP | Missing Color/Style Title"
				end
				if @page.color_picker_element.present? == false
					puts "Asset: #{id} | PDP | Missing Color Options"
				end
				if @page.add_to_cart_element.present? == false && @page.customize_button? == false
					puts "Asset: #{id} | PDP | Missing Add To Cart button"
				end
				if @page.size_dropdown_element.present? == false && @page.add_to_cart_element.present? == true
					puts "Asset: #{id} | PDP | Missing Size Dropdown"
				end
				if @page.fit_size_info_element.present? == false
					puts "Asset: #{id} | PDP | Missing Sizing Info"
				end
				if @page.similar_recent_products_element.present? == false
					puts "Asset: #{id} | PDP | Missing Suggested and Recently Viewed"
				end
				if @page.product_thumbnails_element.present? == false
					puts "Asset: #{id} | PDP | Missing Product Image Thumbnails"
				end
				@page.color_picker_element.buttons.to_a.each do |x|
					x.click
					if @page.placeholder_image_element.present?
						puts "Asset: #{id} | PDP | #{@page.selected_color_element.text} Missing Image"
					end
				end
				BasePage.print_js_errors
				if @page.customize_button?
					@page.customize_button
					@page.wait_until { @customizer.page_load? }
					@customizer.wait_until { @customizer.selected_style? }
					if @customizer.selected_style_element.visible? == false
						puts "Asset: #{id} | Customizer | Missing Product Style Info"
					end
					if @customizer.missing_blob.exists?
						puts "Asset: #{id} | Customizer | Missing Blob"
					end
				end
				BasePage.print_js_errors
			end
		end
	end
end