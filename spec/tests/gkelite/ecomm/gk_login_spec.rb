require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_account_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_home_page"



describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK-Elite Account Login Tests:" do

	before(:all) do
		BasePage.set_base_url
		@login_page = GKLoginPage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@home_page = GKHomePage.new
		BasePage.navigate_to_starting_page
	end


	['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
		context "#{user.upcase}: Login via Header Link" do
			it 'Login' do
				ENV['USER_TYPE'] = user
				BasePage.set_user
				@login_page.header_login
				expect(@login_page.url).to include('/account')
			end

			it 'Logout' do
				@login_page.quick_logout
				expect(@login_page.url).to include($base_url)
			end
		end
	end



	['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
		context "#{user.upcase}: Login via Cart Popup" do
			it 'Login' do
				ENV['USER_TYPE'] = user
				BasePage.set_user
				@home_page.product_page('3728')
				@product_page.add_product_checkout
				@cart_page.login_checkout
				expect(@cart_page.cart_product?).to eq(true)
			end

			it 'Logout' do
				if @cart_page.remove_item?
					@cart_page.remove_item
				end
				@login_page.quick_logout
				@login_page.wait_until { @login_page.url == $base_url + "/" }
				expect(@login_page.url).to eq($base_url + '/')
			end
		end
	end
end

