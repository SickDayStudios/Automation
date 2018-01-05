require './lib/pages/gkelite/gk_search_results_page'
require './lib/pages/gkelite/gk_home_page'
require './lib/pages/gkelite/gk_product_page'
require './lib/pages/gkelite/gk_shopify_base_page'


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - URL Navigation Test:" do

	before(:all) do
		BasePage.setup
		@page = GKSearchResultsPage.new
	end

	it 'Navigate to each Collection URL' do
		@arr = Array.new
		$collection_links.each do |url|
			@page.goto("#{$base_url}/collections/#{url}")
			if @page.four_oh_four?
				puts("FAILED: #{url}")
				@arr.push(url)
			end
		end
		puts @arr
	end
end

