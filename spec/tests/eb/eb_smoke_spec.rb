require "./lib/pages/eb/eb_base_page"

describe "Eddie Bauer Smoke Test: " do

	before(:all) do
		BasePage.set_user
		BasePage.set_base_url
		BasePage.resize_window
		@page = EBBasePage.new
	end

	it "- Pricing" do
		@page.goto "#{$base_url}TVGDRPHZ"
		@page.wait_until { @page.hood_label? }
		sleep 10
		current_price = @page.price
		@page.add_hood_element.click
		@page.wait_while { current_price == @page.price}
		expect(@page.price).to eq("$279.00")
		@page.select_size
		sleep 5
	end

	# context "Men's MT: " do

	# 	it "- SideNav Tag Labels" do
	# 		if ENV['ENVIRONMENT'] == 'staging'
	# 			@page.goto "#{$base_url}JV5FSWGX"
	# 		else
	# 			@page.goto "#{$base_url}TVGDRPHZ"
	# 		end
	# 		expect(@page.hood_label).to include("HOOD ($30)")
	# 		expect(@page.body_label).to include("BODY")
	# 		expect(@page.shoulder_collar_hood_label).to include("SHOULDER & COLLAR/HOOD")
	# 		expect(@page.sleeves_label).to include("SLEEVES")
	# 		expect(@page.stretch_panel_label).to include("STRETCH PANELS")
	# 		expect(@page.zipper_label).to include("MAIN ZIPPER")
	# 		expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
	# 		expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
	# 		expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
	# 		expect(@page.interior_lining_label).to include("INTERIOR LINING")
	# 		expect(@page.interior_label).to include("INTERIOR LABEL")
	# 		expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
	# 		expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
	# 		expect(@page.size_label).to include("SIZE")
	# 	end

	# 	it "- Color Options" do
	# 		expect(@page.product_color_options).to match_array($mt_mens)
	# 	end
	# end

	# context "Women's MT: " do

	# 	it "- SideNav Tag Labels" do
	# 		if ENV['ENVIRONMENT'] == 'staging'
	# 			@page.goto "#{$base_url}TQ2F6NWT"
	# 		else
	# 			@page.goto "#{$base_url}6KAGTRRB"
	# 		end
	# 		expect(@page.hood_label).to include("HOOD ($30)")
	# 		expect(@page.body_label).to include("BODY")
	# 		expect(@page.sleeves_shoulder_hood_label).to include("SLEEVES & COLLAR/HOOD")
	# 		expect(@page.stretch_panel_label).to include("STRETCH PANELS")
	# 		expect(@page.side_panels_label).to include("SIDE PANELS")
	# 		expect(@page.zipper_label).to include("MAIN ZIPPER")
	# 		expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
	# 		expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
	# 		expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
	# 		expect(@page.interior_lining_label).to include("INTERIOR LINING")
	# 		expect(@page.interior_label).to include("INTERIOR LABEL")
	# 		expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
	# 		expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
	# 		expect(@page.size_label).to include("SIZE")
	# 	end

	# 	it "- Color Options" do
	# 		expect(@page.product_color_options).to match_array($mt_womens)
	# 	end
	# end

	# context "Men's SS: " do

	# 	it "- SideNav Tag Labels" do
	# 		if ENV['ENVIRONMENT'] == 'staging'
	# 			@page.goto "#{$base_url}9E7GDN34"
	# 		else
	# 			@page.goto "#{$base_url}SM3QW5EY"
	# 		end
	# 		expect(@page.hood_label).to include("HOOD ($30)")
	# 		expect(@page.body_label).to include("BODY")
	# 		expect(@page.shoulder_collar_hood_label).to include("SHOULDER & COLLAR/HOOD")
	# 		expect(@page.sleeves_label).to include("SLEEVES")
	# 		expect(@page.side_panels_label).to include("SIDE PANELS")
	# 		expect(@page.thread_label).to include("THREAD")
	# 		expect(@page.zipper_label).to include("MAIN ZIPPER")
	# 		expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
	# 		expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
	# 		expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
	# 		expect(@page.interior_label).to include("INTERIOR LABEL")
	# 		expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
	# 		expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
	# 		expect(@page.size_label).to include("SIZE")
	# 	end

	# 	it "- Color Options" do
	# 		expect(@page.product_color_options).to match_array($ss_mens)
	# 	end
	# end

	# context "Women's SS: " do

	# 	it "- SideNav Tag Labels" do
	# 		if ENV['ENVIRONMENT'] == 'staging'
	# 			@page.goto "#{$base_url}LUA2USRS"
	# 		else
	# 			@page.goto "#{$base_url}Z3M9M66R"
	# 		end
	# 		expect(@page.hood_label).to include("HOOD ($30)")
	# 		expect(@page.body_label).to include("BODY")
	# 		expect(@page.shoulder_collar_hood_label).to include("SHOULDER & COLLAR/HOOD")
	# 		expect(@page.sleeves_label).to include("SLEEVES")
	# 		expect(@page.side_panels_label).to include("SIDE PANELS")
	# 		expect(@page.thread_label).to include("THREAD")
	# 		expect(@page.zipper_label).to include("MAIN ZIPPER")
	# 		expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
	# 		expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
	# 		expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
	# 		expect(@page.interior_label).to include("INTERIOR LABEL")
	# 		expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
	# 		expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
	# 		expect(@page.size_label).to include("SIZE")
	# 	end

	# 	it "- Color Options" do
	# 		expect(@page.product_color_options).to match_array($ss_womens)
	# 	end
	# end

	# context "API: " do
		# $staging_eb_products.each do |id|
		# it "API CALL: #{id}" do
		# 	url = "https://staging.spectrumcustomizer.com/api/recipesets/readable/#{id}"
		# 	uri = URI(url)
		# 	response = Net::HTTP.get(uri)
		# 	specs = JSON.parse(response)
		# 	puts specs
		# end
	# end
end