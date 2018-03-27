require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_home_page"


describe "#{ENV['SITE'].upcase} | #{ENV['ENVIRONMENT'].upcase} | #{ENV['BROWSER'].upcase} | #{ENV['USER_TYPE'].upcase} - GK Product GUI Test" do

	before(:all) do
		@arr = Array.new
		@page = GKProductPage.new
		@login_page = GKLoginPage.new
		BasePage.set_base_url
		BasePage.navigate_to_starting_page
	end


	
	it "-------------------------------------------" do
		['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
			ENV['USER_TYPE'] = user
			BasePage.set_user
			@page.enter_password
			@login_page.header_login
			@login_page.wait_until { @login_page.url.include?('account') }
			$gk_assets.each do |id|
				puts " - Verifying: #{user} | #{id}"
				@page.product_page(id)
				if @page.four_oh_four?
					puts "#{id} | #{@page.selected_color_element.text} | PageError | 404 Missing Product From Product Feed"
				else
					@page.wait_while { @page.product_image_element.exists? == false }
					@page.wait_until { @page.product_image_element.visible? }
					if @page.product_accordions_element.present? == false
						puts "#{id} | #{@page.selected_color_element.text} | Missing Product Detail Accordians"
					end
					if @page.product_info_element.present? == false
						puts "#{id} | #{@page.selected_color_element.text} | Missing Product Info"
					end
					if @page.price_element.text.nil? == true || @page.price_element.text == "$0.00"
						puts "#{id} | #{@page.selected_color_element.text} | Missing Price"
					end
					if @page.selected_color_element.present? == false
						puts "#{id} | #{@page.selected_color_element.text} | Missing Color/Style Title"
					end
					if @page.color_picker_element.present? == false
						puts "#{id} | #{@page.selected_color_element.text} | Missing Color Options"
					end
					if @page.customize_button_element.present? == true && @page.add_to_cart_element.present? == false && @page.size_dropdown_element.present? == false
						if @page.fit_size_info_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Sizing Info"
						end
						if @page.similar_recent_products_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Suggested and Recently Viewed"
						end
						if @page.product_thumbnails_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Product Image Thumbnails"
						end

						@page.color_picker_element.buttons.to_a.each do |x|
							x.click
							if @page.product_image_element.attribute_value('src').include?('placeholder')
								puts "#{id} | #{@page.selected_color_element.text} | Placeholder Image"
							end
						end
						BasePage.print_js_errors
					else
						if @page.add_to_cart_element.present? == false && @page.customize_button_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Add To Cart button"
						end
						if @page.size_dropdown_element.present? == false && @page.customize_button_element.present? == false 
							puts "#{id} | #{@page.selected_color_element.text} | Missing Size Dropdown"
						end
						if @page.fit_size_info_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Sizing Info"
						end
						if @page.similar_recent_products_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Suggested and Recently Viewed"
						end
						if @page.product_thumbnails_element.present? == false
							puts "#{id} | #{@page.selected_color_element.text} | Missing Product Image Thumbnails"
						end
						@page.color_picker_element.buttons.to_a.each do |x|
							x.click
							if @page.product_image_element.attribute_value('src').include?('placeholder')
								puts "#{id} | #{@page.selected_color_element.text} | Placeholder Image"
							end
						end
						BasePage.print_js_errors
					end
				end
			end
			@login_page.quick_logout
		end
	end
end