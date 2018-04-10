require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/gkelite/gk_home_page"
require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_payment_page"
require "./lib/pages/gkelite/gk_checkout_page"

describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase}:#{ENV['USER_TYPE'].upcase} - GK Ecomm Smoke Test:" do

	before(:all) do
		BasePage.setup
		@customizer = CustomizerPage.new
		@login_page = GKLoginPage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@home_page = GKHomePage.new
		@payment_page = GKPaymentPage.new
		@checkout_page = GKCheckoutPage.new
	end

	it ' - Navigate to Login Page' do
		@home_page.wait_until { @home_page.password? }
		sleep 1
		@home_page.enter_password
		sleep 1
		@home_page.home_page
		sleep 1
		@home_page.login_page
		sleep 1
		expect(@login_page.url).to include('/account/login')
	end

	it ' - Sign Into Pre-Existing Account' do
		@login_page.select_email_login_radio
		sleep 1
		@login_page.login_with($username, $password)
		sleep 1
		expect(@login_page.url).to include('/account')
	end


	it ' - Navigate to 2008' do
		@home_page.product_page('2008')
		expect(@home_page.url).to include('2008')
	end

	it ' - Customize Product' do
		@product_page.customize_button
		expect(@product_page.url).to include("design")
	end

	it ' - Continue to Customized Product Page' do
		@customizer.quick_custom_asset
		expect(@customizer.url).to include('sizes-and-alterations')
	end

	it ' - Select Random Options' do
		@product_page.wait_until(120) { @product_page.product_image? }
		@product_page.random_size
		expect(@product_page.selected_size).not_to eq("")
	end

	it ' - Add Product to Cart' do
		@product_page.add_to_cart
		@product_page.wait_until { @product_page.cart_popup? }
		expect(@product_page.cart_popup?).to eq(true)
	end

	it ' - Lightbox: Checkout' do
		@product_page.checkout
		expect(@product_page.url).to include('/cart')
	end

	it ' - Secure Checkout' do
		@cart_page.secure_checkout
		sleep 1
	end

	it ' - Continue to Shipping Method' do
		@checkout_page.continue_to
		sleep 1
	end

	it ' - Continue to Payment Method' do
		@checkout_page.continue_to
		sleep 1
		@checkout_page.wait_until { @checkout_page.different_address? }
		sleep 1
	end

	if ENV['ENVIRONMENT'] == 'prod'
		it ' - Complete Order' do
			@checkout_page.continue_to
			sleep 1
			expect(@payment_page.url).to include("pay.gkelite")
		end
	end

	if ENV['ENVIRONMENT'] == 'staging' || ENV['ENVIRONMENT'] == 'test'

		it ' - Complete Order' do
			@checkout_page.continue_to
			sleep 1
			expect(@payment_page.url).to include("pay-gkelite")
		end

		if ENV['USER_TYPE'] == 'dealer' || ENV['USER_TYPE'] == 'distributor' || ENV['USER_TYPE'] == 'teamlead'
			it ' - Select Random Sales Rep' do
				@payment_page.select_random_rep
				sleep 1
			end
		end

		
		it ' - Place Order' do
			@payment_page.place_order
			sleep 1
			@payment_page.wait_while { @payment_page.loader? }
			sleep 1
			expect(@payment_page.url).to include("processing")
		end

		it ' - Payment Processed Successfully' do
			@payment_page.wait_while { (@payment_page.url.include? "processing") }
			sleep 1
			expect(@payment_page.url).to include("thank_you")
		end
	end
end