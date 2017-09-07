require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_account_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_home_page"



describe "#{ENV['SITE']}:#{ENV['ENVIRONMENT']}:#{ENV['BROWSER']} - GK-Elite Account Login Tests:" do

attr_accessor :login_page, :product_page, :cart_page

	before(:all) do
		@login_page = GKLoginPage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@home_page = GKHomePage.new
		@email = 'cason.williams@pollinate.com'
		@password = 'gk123!@#'
	end

	context 'Login via Login Page' do
		it 'Navigate to Login Page' do
			@home_page.login_page
			@home_page.enter_password
			expect(@login_page.url).to include('/account/login')
		end

		it 'Sign Into Pre-Existing Account' do
			@login_page.login_with(@email, @password)
			expect(@login_page.url).to include('/account')
		end

		it 'Logout' do
			@login_page.quick_logout
			expect(@login_page.url).to include($base_url)
		end
	end

	context 'Login via Header Link' do
		it 'Header Sign In' do
			@home_page.home_page
			@login_page = @home_page.header_signin
			@login_page.login_with(@email, @password)
			expect(login_page.url).to include('/account')
		end

		it 'Logout' do
			@login_page.quick_logout
			expect(@login_page.url).to include($base_url)
		end
	end

	context 'Login via Cart Popup' do
		it 'Navigate to Product Page' do
			@product_page = @home_page.product_page('3728')
			expect(product_page.url).to include('/products/3728')
		end

		it 'Add Product to Cart' do
			@product_page.size_dropdown_element.click
			@product_page.size_cs
			@product_page.add_to_cart
			@product_page.wait_until { @product_page.overlay? }
			expect(@product_page.overlay?).to eq(true)
		end

		it 'Navigate to Checkout Page' do
			cart_page = @product_page.checkout
			expect(@cart_page.url).to include('/cart')
		end

		it 'Click Secure Checkout Button' do
			@cart_page.checkout
			expect(@cart_page.signin_popup?).to eq(true)
		end

		it 'Sign In via Popup' do
			@cart_page.email = 'cason.williams@pollinate.com'
			@cart_page.password = 'gk123!@#'
			@cart_page.sign_in
			expect(@cart_page.url).to include('/checkouts/')
		end

		it 'Logout' do
			@login_page.quick_logout
			expect(@login_page.url).to include($base_url)
		end
	end

end

