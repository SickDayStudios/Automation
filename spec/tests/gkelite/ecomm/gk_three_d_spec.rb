require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/asset_api_page"


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK Cheer 3D Customizer Test: " do

	before(:all) do
		# DeferredGarbageCollection.start
		@arr = Array.new
		@pdp = GKProductPage.new
		@page = CustomizerPage.new
		$gk_scene_files.each do  |scene|
			AssetAPI.scene_productoptions_keys(scene).each do |handle|
				@arr.push(handle.scan(/(?=\w*[0-9])\w*/))
			end
		end
		@product_handles = @arr.flatten
	end

	# after(:each) do
	# 	DeferredGarbageCollection.reconsider
	# end

	it "Test Complete" do
		aggregate_failures "Aggregated Failures" do
			@product_handles.each do |id|
				$driver.goto "preview.gkelite.com/products/#{id}"
				if @pdp.four_oh_four?
					puts "#{id} | PDP | No Product Found"
				else
					@pdp.wait_until { @pdp.customize_button? }
					if @pdp.customize_button_element.present? == false
						puts "#{id} | PDP | is missing Customize Button"
					else
						@pdp.customize_button_element.scroll.to :center
						@pdp.customize_button
						@page.wait_until(90) { @page.spinner_precentage == "100%" }
						@page.wait_until { @page.page_load_element.present? }
						sleep 1
						if @page.disclaimer_checkbox_element.present?
							@page.wait_until { @page.disclaimer_checkbox_element.visible?}
							@page.disclaimer_checkbox_element.scroll.to :center
							@page.check_disclaimer_checkbox
						end
						sleep 1
						if @page.embellishments_button_element.present?
							@page.embellishments_button_element.scroll.to :center
							@page.embellishments_button
							@page.wait_until { @page.url.include?("embellishments") }
						end
						sleep 1
						if @page.additional_options_button_element.present?
							@page.additional_options_button_element.scroll.to :center
							@page.additional_options_button
							@page.wait_until { @page.url.include?("additional") }
						end
						sleep 1
						if @page.size_alterations_button_element.present?
							@page.size_alterations_button_element.scroll.to :center
							@page.size_alterations_button
							@page.wait_until { @page.url.include?("alterations") } 
						end
						sleep 1
						if @page.size_alterations_popup_element.present?
							@page.wait_until { @page.size_alterations_popup_element.present? }
							if @page.popup_checkbox_one_element.present?
								@page.check_popup_checkbox_one
							end
							if @page.popup_checkbox_two_element.present?
								@page.check_popup_checkbox_two
							end
							if @page.popup_next_button_element.present?
								@page.popup_next_button_element.scroll.to :center
								@page.popup_next_button
							end
						end
						sleep 10
						@pdp.wait_while {@pdp.error_message_element.present? == false && $driver.url.include?("sizes-and-alterations")}
						if @pdp.error_message_element.present?
							puts "#{id} | PDP | Failed to Load Customized PDP"
						else
							@page.wait_until(90) { @page.url.include?("products") }
							puts "#{id} | #{$driver.url}"
							sleep 1
							if @pdp.price_element.text.nil? == true
								puts "Asset: #{id} | PDP | Missing Price"
							end
							if @pdp.add_to_cart_element.present? == false
								puts "Asset: #{id} | PDP | Missing Add To Cart button"
							end
							if @pdp.size_dropdown_element.present? == false && @pdp.add_to_cart_element.present? == true
								puts "Asset: #{id} | PDP | Missing Size Dropdown"
							end
							if @pdp.product_thumbnails_element.present? == false
								puts "Asset: #{id} | PDP | Missing Product Image Thumbnails"
							end
							@pdp.color_picker_element.buttons.to_a.each do |x|
								x.click
								if @pdp.placeholder_image_element.present?
									puts "Asset: #{id} | PDP | #{@pdp.selected_color_element.text} Missing Image"
								end
							end
						end
					end
				end
			end
		end
	end
end
