require './lib/pages/gkelite/gk_search_results_page'
require './lib/pages/gkelite/gk_home_page'
require './lib/pages/gkelite/gk_product_page'


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK Search Test:" do

	before(:all) do
		BasePage.navigate_to_starting_page
		@page = GKSearchResultsPage.new
	end


	context 'Header Search Keyword' do
		it 'Verify Search Feature Returns Results: ' do
			@page.search_for('Leotard')
			expect(@page.url).to include('Leotard')
			expect(@page.search_result_text).to include('Leotard')
		end
	end


	context 'Filters' do

		it 'Filter by Type: In Stock' do
			sleep 2
			no_filter = @page.search_result_text
			@page.in_stock_element.click
			sleep 2
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.in_stock_element.click
			sleep 2
		end

		it 'Filter by Type: Special Order' do
			no_filter = @page.search_result_text
			@page.special_order_element.click
			sleep 2
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.special_order_element.click
			sleep 2
		end

		it 'Filter by Size' do
			@page.sizes_elements.each do |size|
				no_filter = @page.search_result_text
				size.checkbox_element.focus
				puts size.checkbox_element
				size.checkbox.set(true)
				sleep 2
				filter = @page.search_result_text
				expect(no_filter).not_to eq(filter)
				size.checkbox.set(false)
				sleep 2
			end
		end

		it 'Filter by Minimum Price' do
			no_filter = @page.search_result_text
			@page.price_min_element.focus
			@page.price_min = "#{rand(75..100)}"
			@page.price_min_element.send_keys :return
			sleep 1
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.price_min = "0"
			@page.price_min_element.send_keys :return
			sleep 1
		end

		it 'Filter by Maximum Price' do
			no_filter = @page.search_result_text
			@page.price_max_element.focus
			@page.price_max = "#{rand(105..125)}"
			@page.price_max_element.send_keys :return
			sleep 1
			filter = @page.search_result_text
			expect(no_filter).not_to eq(filter)
			@page.price_max = "400"
			@page.price_max_element.send_keys :return
			sleep 1
		end

		it 'Filter by Rating' do
			no_filter = @page.search_result_text
			@page.send_keys :page_down
			@page.no_star_element.focus
			@page.rating_filters
			sleep 1
			filter = @page.search_result_text
			expect(no_filter).to eq(filter)
		end
	end


	# context 'Quick View' do
	# 	it '' do

	# 	end
	# end
end