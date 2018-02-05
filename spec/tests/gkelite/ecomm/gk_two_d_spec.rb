require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_home_page"

describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - 2D Customizer Test: " do

	before(:all) do
		BasePage.setup
		@page = GKProductPage.new
		@login_page = GKLoginPage.new
	end

	['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
		context "#{user.upcase}: Check PDP Elements" do
			it '2D Verification | 3456' do
				ENV['USER_TYPE'] = user
				BasePage.set_user
				@login_page.header_login
				@login_page.wait_until { @login_page.url.include?('account') }
				aggregate_failures "FAILURE!!!!!!!" do
					@page.goto "#{$base_url}/products/3456"
					@page.wait_until { @page.product_container_element.present? }
					sleep 2
					if (@page.add_to_cart? == true && @page.customize_button? == true)
						@page.color_buttons.each do |link|
							@page.goto "#{link}"
							@page.wait_until { @page.next_button? }
							if @page.blob_not_found_element.exists?
								puts "Blob Not Found"
							end
							@page.next_button
							@page.wait_while { @page.saving_design? }
							@page.wait_until { @page.url.include?('products') }
							@page.wait_until { @page.product_container_element.present? }
							sleep 2
							expect(@page.color_chooser_element.present?).to eq(true)
							expect(@page.review_design_element.present?).to eq(true)
							expect(@page.size_dropdown_element.present?).to eq(true)
							if @page.placeholder_image? == true
								puts "Missing Product Image #{@page.selected_color_element.text}"
							end
							expect(@page.product_image?).to eq(true)
							expect(@page.save_design_element.present?).to eq(true)
							expect(@page.add_to_cart_element.present?).to eq(true)
						end
					else
						puts "Remove from 2D asset list"
					end
				end
				@login_page.quick_logout
			end
		end
	end
end

