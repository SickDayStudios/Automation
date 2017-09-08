require './lib/pages/gkelite/gk_search_results_page'
require './lib/pages/gkelite/gk_home_page'
require './lib/pages/gkelite/gk_product_page'


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK Search Test:" do

	before(:all) do
		@homepage = GKHomePage.new
		@searchpage = GKSearchResultsPage.new
		@productpage = GKProductPage.new
		@homepage.home_page
		@homepage.wait_until { @homepage.search_field? }
	end


	context 'Header Search Keyword' do
		it 'Enter Keyword' do
			@homepage.search_field = 'Leotard'
			expect(@homepage.search_field).to include('Leotard')
		end

		it 'Return Search Results' do
			@homepage.search_field_element.send_keys(:return)
			expect(@homepage.url).to include('Leotard')
			sleep 2
		end
	end


	context 'Filters' do
		it 'Filter by Competitive Type' do
			@searchpage.wait_until { @searchpage.filters? }
			sleep 2
			@searchpage.type_one_element.set
			expect(@searchpage.type_one.set?).to eq(true)
		end

		it 'Filter by Long Sleeve Type' do
			
		end

		it 'Filter by Training Type' do
			
		end

		it 'Filter by Collection Filter' do
			
		end

		it 'Filter by Random Size' do

		end

		it 'Filter by Random Color' do

		end

		it 'Filter by Price Range' do

		end

		it 'Filter by Rating' do

		end
	end


	context 'Quick View' do
		it '' do

		end
	end
end