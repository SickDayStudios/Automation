require './lib/pages/gkelite/gk_search_results_page'
require './lib/pages/gkelite/gk_home_page'
require './lib/pages/gkelite/gk_product_page'
require './lib/pages/gkelite/gk_shopify_base_page'



describe "#{ENV['SITE']}:#{ENV['ENVIRONMENT']}:#{ENV['BROWSER']} - URL Navigation Test:" do

	before(:all) do
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
		expect(@arr).to be_empty
	end

	it 'Navigate to each Not Customizable Product Page' do
		@arr = Array.new
		$stock_products.each do |id|
			@page.product_page(id)
			if @page.four_oh_four?
				puts("FAILED: #{id}")
				@arr.push(id)
			end
		end
		expect(@arr).to be_empty
	end

	it "Navigate to each Customizable Product Page" do
		@arr = Array.new
		$three_d_products.each do |id|
			@page.product_page(id)
			if @page.four_oh_four?
				puts("FAILED: #{id}")
				@arr.push(id)
			end
		end
		expect(@arr).to be_empty
	end

	it "Navigate to each Customizable Product Page" do
		@arr = Array.new
		$two_d_products.each do |id|
			@page.product_page(id)
			if @page.four_oh_four?
				puts("FAILED: #{id}")
				@arr.push(id)
			end
		end
		expect(@arr).to be_empty
	end
end

