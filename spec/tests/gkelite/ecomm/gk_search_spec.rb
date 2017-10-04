require './lib/pages/gkelite/gk_search_results_page'
require './lib/pages/gkelite/gk_home_page'
require './lib/pages/gkelite/gk_product_page'


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK Search Test:" do

	before(:all) do
		BasePage.navigate_to_starting_page
		@page = GKSearchResultsPage.new
		@product_page = GKProductPage.new
	end


	context 'Header Search Keyword' do
		it 'Verify Search Feature Returns Results: ' do
			@page.search_for('Leotard')
			expect(@page.url).to include('Leotard')
			expect(@page.search_result_text).to include('Leotard')
		end
	end


	context 'Filters: ' do

		it 'Type: In Stock' do
			no_filter = @page.search_result_text
			@page.check_in_stock
			@page.wait_while { @page.search_result_text == no_filter }
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.uncheck_in_stock
			@page.wait_until { @page.search_result_text == no_filter }
		end

		it 'Type: Special Order' do
			no_filter = @page.search_result_text
			@page.check_special_order
			@page.wait_while { @page.search_result_text == no_filter }
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.uncheck_special_order
			@page.wait_until { @page.search_result_text == no_filter }
		end

		it 'Size' do
			@page.sizes_elements.each do |size|
				no_filter = @page.search_result_text
				size.checkbox.set(true)
				@page.wait_while { @page.search_result_text == no_filter }
				filter = @page.search_result_text
				expect(no_filter).not_to eq(filter)
				size.checkbox.set(false)
				@page.wait_until { @page.search_result_text == no_filter }
			end
		end

		it 'Minimum Price' do
			no_filter = @page.search_result_text
			@page.price_min = "#{rand(75..100)}"
			@page.price_min_element.send_keys :return
			@page.wait_while { @page.search_result_text == no_filter }
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.price_min = "0"
			@page.price_min_element.send_keys :return
		end

		it 'Maximum Price' do
			no_filter = @page.search_result_text
			@page.price_max = "#{rand(105..125)}"
			@page.price_max_element.send_keys :return
			@page.wait_while { @page.search_result_text == no_filter }
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.price_max = "400"
			@page.price_max_element.send_keys :return
		end

		it 'Rating' do
			no_filter = @page.search_result_text
			@page.check_rating_filters
			@page.wait_until { @page.search_result_text == no_filter }
			filter = @page.search_result_text
			expect(no_filter).to eq(filter)
			@page.uncheck_rating_filters
			@page.wait_until { @page.search_result_text == no_filter }
		end
	end


	context 'Quick View: ' do
		it 'Add Item to Cart via Quick View' do
			@page.send_keys :page_up, :page_up
			@page.quick_view
			@product_page.random_options
			@product_page.add_to_cart
			@page.wait_until { @page.added_to_cart? }
			expect(@page.added_to_cart?).to eq(true)
		end
	end
end