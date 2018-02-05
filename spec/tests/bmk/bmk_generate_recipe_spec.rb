require "./lib/pages/bmk/bmk_base_page"

describe "BMK Knife Generator" do

	before(:all) do
		@browser = BMKBasePage.new
		@hash = Hash.new
	end

	after(:all) do

	end

	it "Price: Verified" do
		puts "Generate 100 Recipes"
		100.times do
			aggregate_failures "" do
				pair = @browser.random_knife
				@hash.store(pair[0],pair[1])
			end
		end
		puts "Verify Recipe XML"
		puts @hash
		@hash.each do |k,v|
			@response = BMKBasePage.bmk_saved_spec(k)
			spec = @response.search('pre').text.scan(/(?<=\>)(.*?)(?=\<)/).flatten
			expect(spec[14]).to include(v)
		end
	end
	
end