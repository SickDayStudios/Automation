require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/gkelite/gk_home_page"
require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_payment_page"
require "./lib/pages/gkelite/gk_checkout_page"

describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase}:#{ENV['USER_TYPE'].upcase} - GK Ecomm Smoke Test:" do

	before(:all) do
		@login_page = GKLoginPage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@home_page = GKHomePage.new
		@payment_page = GKPaymentPage.new
		@checkout_page = GKCheckoutPage.new
	end

	it ' - Navigate to Login Page' do
		@home_page.login_page
		expect(@login_page.url).to include('/account/login')
	end

	it ' - Sign Into Pre-Existing Account' do
		@login_page.login_with($username, $password)
		expect(@login_page.url).to include('/account')
	end


	it ' - Navigate to Product Page' do
		@home_page.product_page('3734')
		expect(@home_page.url).to include('3734')
	end

	it ' - Add Product to Cart' do
		@product_page.wait_until { @product_page.product_thumbnails? }
		@product_page.random_options
		@product_page.add_to_cart_element.focus
		@product_page.add_to_cart
		@product_page.wait_until { @product_page.cart_popup? }
		expect(@product_page.cart_popup?).to eq(true)
	end

	it ' - Lightbox Checkout' do
		@product_page.checkout_element.focus
		@product_page.checkout
		expect(@product_page.url).to include('/cart')
	end

	it ' - Secure Checkout' do
		@cart_page.secure_checkout_element.focus
		@cart_page.secure_checkout
	end

	it ' - Continue to Shipping Method' do
		@checkout_page.continue_to_element.focus
		@checkout_page.continue_to
	end

	it ' - Continue to Payment Method' do
		@checkout_page.continue_to_element.focus
		@checkout_page.continue_to
		@checkout_page.wait_until { @checkout_page.different_address? }
		expect(@checkout_page.current_breadcrumb).to eq('Payment method')
	end

	it ' - Complete Order' do
		@checkout_page.continue_to_element.focus
		@checkout_page.continue_to
		expect(@payment_page.url).to include("pay-gkelite")
	end

# => TODO: Figure out a way to set the proper range index for credit card options
	# it ' - Select Random Saved CC or Fill New CC Form' do
	# 	@payment_page.wait_while { @payment_page.page_load? }
	# 	if @payment_page.billing_info? == true
	# 		@payment_page.select_random_card
	# 	elsif @payment_page.billing_info? == false
	# 		@payment_page.add_new_card.set
	# 		@payment_page.fill_credit_card
	# 	end
	# end

	if ENV['USER_TYPE'] == 'dealer' || ENV['USER_TYPE'] == 'distributor' || ENV['USER_TYPE'] == 'salesrep' || ENV['USER_TYPE'] == 'teamlead'
		it ' - Select Random Sales Rep' do
			@payment_page.select_random_rep_element.focus
			@payment_page.select_random_rep
		end
	end

	it ' - Place Order' do
		@payment_page.place_order_element.focus
		@payment_page.place_order
		@payment_page.wait_while { @payment_page.loader? }
		expect(@payment_page.url).to include("processing")
	end

	it ' - Payment Processed Successfully' do
		@payment_page.wait_while { (@payment_page.url.include? "processing") }
		expect(@payment_page.url).to include("thank_you")
	end
end