require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_cart_page"
require "./lib/helpers/gkelite/gk_cart_lightbox"
require "./lib/pages/gkelite/customizer_page"


describe 'GK Ecomm Smoke Test' do

	before(:all) do
		@page = GKProductPage.new
	end
	context "Product Page Functionality Test:" do

		it 'Navigate to Product Page' do
			@page.product_page('3728')
			expect(@page.url).to include('/products/')
		end

		it 'Select Random Options' do
			@page.wait_until { @page.size_dropdown? }
			@page.random_options
			expect(@page.size_dropdown).not_to be_empty
		end

		it 'Click Sizing Chart' do
			#@page.sizing_chart
			expect(@page.sizing_chart?).to eq(true)
		end

		# it 'Dismiss Sizing Chart Popup' do
		# 	@page.size_close_element.click
		# 	expect(@page.size_lightbox_element.visible?).to eq(false)
		# end

		it 'Product Details Are Present' do
			expect(@page.product_details?).to eq(true)
		end

		it 'Open Fabric Care Accordian' do
			@page.fabric_care_element.click
			expect(@page.show_more?).to eq(true)
		end

		it 'Click Show More Link' do
			expect(@page.show_more?).to eq(true)
		end

		# it 'Dismiss Fabric Care Popup' do
		# 	@page.size_close_element.click
		# 	expect(@page.fabric_care_modal_element.visible?).to eq(false)
		# end

		it 'Open Reviews Accordian' do
			@page.review_element.click
			expect(@page.write_cancel_review?).to eq(true)
			expect(@page.review_header?).to eq(true)
			expect(@page.review_body?).to eq(true)
		end

		it 'Click Write a Review Link' do
			@page.write_cancel_review
			expect(@page.review_name?).to eq(true)
		end

		it 'Submit incomplete Review' do
			@page.submit_review
			expect(@page.errors).to eq('This field is required.')
		end

		it 'Cancel Review' do
			@page.write_cancel_review
			expect(@page.review_name?).to eq(true)
		end

		it 'Click Write a Review Link' do
			@page.write_cancel_review
			expect(@page.review_name?).to eq(true)
		end

		it 'Fill Review Form' do
			@page.fill_review
			expect(@page.review_name).to eq('Tester')
			expect(@page.review_email).to eq('test@qa.com')
			expect(@page.review_title).to eq('This is a test')
			expect(@page.review_body).to eq('TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST')
		end

		it 'Submit Review' do
			@page.submit_review
			expect(@page.review_confirm).to eq("Thank you for submitting your review! Please refresh the page in a few moments to see your review.")
		end

		it 'Add Product To Cart' do
			@page.scroll.to :top
			@page.add_to_cart
			@page.wait_until { @page.cart_popup? }
			expect(@page.cart_popup?).to eq(true)
		end

		it 'Continue Shopping' do
			@page.continue_shopping
			@page.wait_while { @page.cart_popup? }
			expect(@page.cart_popup?).to eq(false)
		end
	end
end