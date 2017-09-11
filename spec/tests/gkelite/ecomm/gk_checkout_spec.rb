require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_home_page"
require "./lib/pages/gkelite/gk_checkout_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/gk_payment_page"



describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK-Elite Checkout Test:" do

	before(:all) do
		@home_page = GKHomePage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@checkout_page = GKCheckoutPage.new
		@payment_page = GKPaymentPage.new
		@home_page.home_page
	end

	context 'Product Page:' do
		it ' - Navigate to Product Page' do
			@home_page.product_page('3456')
			expect(@home_page.url).to include('3456')
		end

		it ' - Select Random Options' do
			@product_page.random_options
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
	end

	context 'Cart Page:' do
		it ' - Secure Checkout' do
			@cart_page.secure_checkout
			expect(@cart_page.login_popup?).to eq(true)
		end

		it ' - Login Popup: Sign In' do
			@cart_page.email = "cason.williams@pollinate.com"
			@cart_page.password = "qatester"
			@cart_page.sign_in_element.click
			expect(@cart_page.url).to include('/checkouts/')
		end
	end

	context 'Checkout Page:' do
		# it ' - Fill Shipping Address Form' do
		# 	@checkout_page.fill_shipping_address
		# 	expect(@checkout_page.shipping_zip).to eq('97205')
		# end

		it ' - Continue to Shipping Method' do
			@checkout_page.continue_to
			expect(@checkout_page.edit_address?).to eq(true)
		end

		it ' - Shipping Cost is Applied' do
			sleep 3
			@checkout_page.random_shipping_method
			sleep 1
		end

		it ' - Continue to Payment Method' do
			@checkout_page.continue_to
			@checkout_page.wait_until { @checkout_page.different_address? }
			expect(@checkout_page.current_breadcrumb).to eq('Payment method')
		end

		it ' - Use a Different Billing Address' do
			@checkout_page.different_address_element.click
			expect(@checkout_page.different_address_element.set?).to eq(true)
		end

		it ' - Fill Billing Address Form' do
			@checkout_page.fill_billing_address
			expect(@checkout_page.billing_zip).to eq('97205')
		end

		it ' - Complete Order' do
			@checkout_page.continue_to
			expect(@payment_page.url).to include("-pay-gkelite.pollinate.com/")
		end
	end

	context 'Payment Page:' do
		it ' - Fill Credit Card Form' do
			# @payment_page.wait_until { @payment_page.spinner? }
			# @payment_page.wait_while { @payment_page.spinner? }
			@payment_page.fill_credit_card
			expect(@payment_page.warning).to eq("")
		end

		it ' - Place Order' do
			@payment_page.place_order
			expect(@payment_page.loader?).to eq(true) 
		end
	end
end