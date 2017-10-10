require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_account_page"
require "./lib/pages/gkelite/gk_home_page"


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK-Elite Account Register Tests" do

	before(:all) do
		BasePage.setup
		if ENV['ENVIRONMENT'] == 'prod'
			@page.enter_password
		end
		@login_page = GKLoginPage.new
		@home_page = GKHomePage.new 
		@email = 'cason.williams@pollinate.com'
		@password = 'gk123!@#'
		@home_page.home_page
		@home_page.enter_password
	end

	context 'Register via Login Page' do
		it 'Navigate to Login Page' do
			@home_page.login
			expect(@login_page.url).to include('/account/login')
		end

		it 'Click Register Account Button' do
			@login_page.register_account_button
			expect(@login_page.url).to include('account/register')
		end
		
		it 'Complete Registration Form' do
			@login_page.register_account
			expect(@login_page.url).to include('/challenge')
		end
	end

	context 'Register via Header link' do
		it 'Click Register Link' do
			@login_page.header_register
			expect(@login_page.url).to include('/account/register')
		end

		it 'Complete Registration Form' do
			@login_page.register_account
			expect(@login_page.url).to include('/challenge')
		end
	end

	context 'Register via Cart Popup' do
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
	end
end