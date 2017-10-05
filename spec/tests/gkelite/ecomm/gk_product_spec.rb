require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/helpers/gkelite/gk_cart_lightbox"
require "./lib/pages/gkelite/customizer_page"
require "./lib/helpers/deferred_garbage_collection"


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase}:#{ENV['USER_TYPE'].upcase} - GK Product Page Test:" do

	before(:all) do
		# DeferredGarbageCollection.start
		# @page = GKProductPage.new
		# @customizer = CustomizerPage.new
		# BasePage.navigate_to_starting_page
		# if ENV['ENVIRONMENT'] == 'prod'
		# 	@page.enter_password
		# end
	end

	

	# after(:all) do
	# 	DeferredGarbageCollection.reconsider
	# end

	# context "Verify Page Objects For" do
	# 	$stock_products.each do |id|

	# 		it "#{id}: Product Details" do	
	# 			@page.product_page(id)
	# 			expect(@page.product_accordions_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Product Info" do
	# 			expect(@page.product_info_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Price" do
	# 			expect(@page.price).to include('$')
	# 		end

	# 		it "#{id}: Selected Color" do
	# 			expect(@page.selected_color_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Color Picker" do
	# 			expect(@page.color_picker_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Size Dropdown" do
	# 			expect(@page.size_dropdown_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Fit & Size Info" do
	# 			expect(@page.fit_size_info_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Add To Cart Button" do
	# 			expect(@page.add_to_cart_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Similar/Recently Viewed Products" do
	# 			expect(@page.similar_recent_products_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Thumbnails" do
	# 			expect(@page.product_thumbnails_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Product Image" do
	# 			@page.wait_while { @page.placeholder_image? }
	# 			@page.color_picker_element.buttons.to_a.each do |x|
	# 				x.click
	# 				@page.wait_until { @page.product_image? }
	# 				expect(@page.product_image_element.present?).to eq(true)
	# 			end
	# 		end

	# 		it "#{id}: Check Page Errors" do
	# 			expect{BasePage.raise_js_errors}.to_not raise_error
	# 		end
	# 	end

	# 	$three_d_products.each do |id|

	# 		it "#{id}: Product Details" do
	# 			@page.product_page(id)	
	# 			expect(@page.product_accordions_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Product Info" do
	# 			expect(@page.product_info_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Price" do
	# 			expect(@page.price).to include('$')
	# 		end

	# 		it "#{id}: Selected Color" do
	# 			expect(@page.selected_color_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Color Picker" do
	# 			expect(@page.color_picker_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Size Dropdown" do
	# 			expect(@page.size_dropdown_element.present?).to eq(false)
	# 		end

	# 		it "#{id}: Quanity" do
	# 			expect(@page.quantity_element.present?).to eq(false)
	# 		end

	# 		it "#{id}: Fit & Size Info" do
	# 			expect(@page.fit_size_info_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Customize Button" do
	# 			expect(@page.customize_button_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Add To Cart Button" do
	# 			expect(@page.add_to_cart_element.present?).to eq(false)
	# 		end

	# 		it "#{id}: Similar/Recently Viewed Products" do
	# 			expect(@page.similar_recent_products_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Product Image" do
	# 			@page.wait_while { @page.placeholder_image? }
	# 			@page.color_picker_element.buttons.to_a.each do |x|
	# 				x.click
	# 				@page.wait_until { @page.product_image? }
	# 				expect(@page.product_image_element.present?).to eq(true)
	# 			end
	# 		end

	# 		it "#{id}: Thumbnails" do
	# 			expect(@page.product_thumbnails_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Check Page Errors" do
	# 			expect{BasePage.raise_js_errors}.to_not raise_error
	# 		end

	# 		it "#{id}: Customizer Redirect" do
	# 			@page.customize_button
	# 			@page.wait_until { @customizer.page_load? }
	# 			expect(@customizer.selected_style?).to eq(true)
	# 			expect{BasePage.raise_js_errors}.to_not raise_error
	# 		end
	# 	end


	# 	$two_d_products.each do |id|

	# 		it "#{id}: Product Details" do	
	# 			@page.product_page(id)
	# 			expect(@page.product_accordions_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Product Info" do
	# 			expect(@page.product_info_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Price" do
	# 			expect(@page.price).to include('$')
	# 		end

	# 		it "#{id}: Selected Color" do
	# 			expect(@page.selected_color_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Color Picker" do
	# 			expect(@page.color_picker_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Size Dropdown" do
	# 			expect(@page.size_dropdown_element.present?).to eq(false)
	# 		end

	# 		it "#{id}: Quanity" do
	# 			expect(@page.quantity_element.present?).to eq(false)
	# 		end

	# 		it "#{id}: Fit & Size Info" do
	# 			expect(@page.fit_size_info_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Customize Button" do
	# 			expect(@page.customize_button_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Add To Cart Button" do
	# 			expect(@page.add_to_cart_element.present?).to eq(false)
	# 		end

	# 		it "#{id}: Similar/Recently Viewed Products" do
	# 			expect(@page.similar_recent_products_element.present?).to eq(true)
	# 		end

	# 		it "#{id}: Product Image" do
	# 			@page.wait_while { @page.placeholder_image? }
	# 			@page.color_picker_element.buttons.to_a.each do |x|
	# 				x.click
	# 				@page.wait_until { @page.product_image? }
	# 				expect(@page.product_image_element.present?).to eq(true)
	# 			end
	# 		end

	# 		it "#{id}: Thumbnails" do
	# 			expect(@page.product_thumbnails_element.present?).to eq(true)
	# 		end
	# 		it "#{id}: Check Page Errors" do
	# 			expect{BasePage.raise_js_errors}.to_not raise_error
	# 		end

	# 		it "#{id}: Customizer Redirect" do
	# 			@page.customize_button
	# 			@page.wait_until { @customizer.page_load? }
	# 			expect(@customizer.selected_style?).to eq(true)
	# 			expect{BasePage.raise_js_errors}.to_not raise_error
	# 		end
	# 	end
	# end
end