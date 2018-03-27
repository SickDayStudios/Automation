require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/gkelite/gk_home_page"

describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - 2D Customizer Test: " do

	before(:all) do
		BasePage.setup
		@page = GKProductPage.new
		@login_page = GKLoginPage.new
	end

	
	it "2D Verification" do
		['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
			ENV['USER_TYPE'] = user
			BasePage.set_user
			@page.enter_password
			@login_page.header_login
			@login_page.wait_until { @login_page.url.include?('account') }
			$two_d_products.each do |id|
				@page.goto "#{$base_url}/products/#{id}"
				@page.wait_until { @page.product_container_element.present? }
				sleep 2
				if @page.customize_button? == false
					puts "#{id} | Not SWE"
				else
					@page.color_buttons.each do |link|
						aggregate_failures "#{id} | #{link}" do
							@page.goto "#{link}"
							sleep 2
							if @page.blob_not_found?
								puts "#{id} | #{link} | Blob Not Found"
							else
								@page.next_button
								@page.wait_while { @page.saving_design? }
								sleep 1
								if @page.next_button?
									puts "#{id} | #{@page.oops_element.text}"
								else
									@page.wait_until { @page.url.include?('products') }
									if @page.product_accordions_element.present? == false
										puts "Asset: #{id} | PDP | Missing Product Detail Accordians"
									end
									if @page.product_info? == false
										puts "Asset: #{id} | PDP | Missing Product Info"
									end
									if @page.price_element.text.nil? == true
										puts "Asset: #{id} | PDP | Missing Price"
									end
									if @page.selected_color? == false
										puts "Asset: #{id} | PDP | Missing Color/Style Title"
									end
									if @page.color_picker? == false
										puts "Asset: #{id} | PDP | Missing Color Options"
									end
									if @page.add_to_cart? == false
										puts "Asset: #{id} | PDP | Missing Add To Cart button"
									end
									if @page.size_dropdown? == false
										puts "Asset: #{id} | PDP | Missing Size Dropdown"
									end
									if @page.fit_size_info? == false
										puts "Asset: #{id} | PDP | Missing Sizing Info"
									end
									if @page.product_thumbnails? == false
										puts "Asset: #{id} | PDP | Missing Product Image Thumbnails"
									end
									if @page.product_image_element.attribute_value('src').include?('placeholder')
										puts "Asset: #{id} | PDP | #{@page.selected_color_element.text} Missing Image"
									end
								end
							end
						end
					end
				end
			end
			@login_page.quick_logout
		end
	end
end