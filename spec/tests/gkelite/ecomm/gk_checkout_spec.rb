require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_home_page"
require "./lib/pages/gkelite/gk_checkout_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/pages/gkelite/gk_payment_page"
require "./lib/pages/gkelite/customizer_page"
require "./lib/pages/gkelite/gk_login_page"



describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK-Elite Checkout Test:" do

	before(:all) do
		@login_page = GKLoginPage.new
		@customizer = CustomizerPage.new
		@home_page = GKHomePage.new
		@product_page = GKProductPage.new
		@cart_page = GKCartPage.new
		@checkout_page = GKCheckoutPage.new
		@payment_page = GKPaymentPage.new
		@home_page.home_page
	end

	context "Login to: #{ENV['USER_TYPE'].upcase}" do
		it 'Login' do
			@home_page.login_page
			expect(@login_page.url).to include('/account/login')
			@login_page.login_with($username, $password)
			expect(@login_page.url).to include('/account')
		end
	end

	context 'Product Page:' do
		it ' - Navigate to 1974s' do
			@home_page.product_page('1974s')
			expect(@home_page.url).to include('1974s')
		end

		it ' - Customize Product' do
			@product_page.customize_button
			expect(@product_page.url).to include("design")
		end

		it ' - Continue to Customized Product Page' do
			@customizer.wait_while { @customizer.page_load? }
			@customizer.check_disclaimer_checkbox
			@customizer.embellishments_button
			expect(@customizer.url).to include('embellishments')
			@customizer.size_alterations_button
			expect(@customizer.size_alterations_popup?).to eq(true)
			@customizer.check_popup_checkbox_one
			@customizer.check_popup_checkbox_two
			@customizer.popup_next_button
			expect(@customizer.url).to include('sizes-and-alterations')
		end

		it ' - Select Random Options' do
			@product_page.wait_until(60) { @product_page.product_image? }
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
	end

	context 'Checkout Page:' do
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


		if ENV['ENVIRONMENT'] == 'staging' || ENV['ENVIRONMENT'] == 'test'

			if ENV['USER_TYPE'] == 'dealer' || ENV['USER_TYPE'] == 'distributor' || ENV['USER_TYPE'] == 'teamlead'
				it ' - Select Random Sales Rep' do
					@payment_page.select_random_rep
				end
			end


			it ' - Place Order' do
				@payment_page.send_keys :page_down, :page_down
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
	end
end