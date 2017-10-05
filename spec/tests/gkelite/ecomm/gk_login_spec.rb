require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_account_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_home_page"



describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK-Elite Account Login Tests:" do

	before(:all) do
		@login_page = GKLoginPage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@home_page = GKHomePage.new
		BasePage.navigate_to_starting_page
		if ENV['ENVIRONMENT'] == 'prod'
			@home_page.enter_password
		end
	end

	['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
		context "#{user.upcase}: Login via Login Page" do
			it 'Login' do
				ENV['USER_TYPE'] = user
				BasePage.set_user
				@home_page.login_page
				expect(@login_page.url).to include('/account/login')
				@login_page.login_with($username, $password)
				expect(@login_page.url).to include('/account')
			end

			it 'Logout' do
				@login_page.quick_logout
				expect(@login_page.url).to include($base_url)
			end
		end
	end

	['consumer', 'dealer', 'distributor', 'salesrep', 'teamlead'].each do |user|
		context "#{user.upcase}: Login via Header Link" do
			it 'Login' do
				ENV['USER_TYPE'] = user
				BasePage.set_user
				@home_page.home_page
				@home_page.header_signin
				@login_page.login_with($username, $password)
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
				sleep 1
				expect(@product_page.url).to include('/products/3728')
				@product_page.wait_until { @product_page.product_thumbnails? }
				@product_page.random_size
				@product_page.consumer_random_quantity
				expect(@product_page.selected_size).not_to eq("")
				@product_page.add_to_cart
				sleep 1
				@product_page.wait_until { @product_page.cart_popup? }
				expect(@product_page.cart_popup?).to eq(true)
				@product_page.checkout
				sleep 1
				expect(@product_page.url).to include('/cart')
				@cart_page.secure_checkout
				sleep 1
				expect(@cart_page.signin_popup?).to eq(true)
				@cart_page.login_with($username, $password)
				expect(@cart_page.url).to include('/cart')
				sleep 1
			end

			it 'Logout' do
				@login_page.quick_logout
				sleep 1
				expect(@login_page.url).to eq($base_url+'/')
			end
		end
	end
end

