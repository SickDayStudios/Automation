require "./lib/pages/eb/eb_base_page"

describe "Eddie Bauer Smoke Test: " do

	before(:all) do
		BasePage.set_user
		BasePage.set_base_url
		BasePage.resize_window
		@page = EBBasePage.new
	end

	it "" do
		@page.goto "#{$base_url}men-s-custom-microtherm-stormdown-jacket/38832296"
		sleep 30
		current_price = @page.price
		@page.select_size
		@page.wait_while { current_price == @page.price}
		@page.add_to_bag_element.click
		@page.wait_until { @page.cart_popup? }
		puts @page.body
		puts @page.collar_hood
		puts @page.sleeves
		puts @page.stretch_panel
		puts @page.main_zipper
		puts @page.pocket_zipper
		puts @page.zipper_pull
		puts @page.logos
		puts @page.lining
		puts @page.label
		puts @page.monogram_one
		puts @page.monogram_two
	end

	

	# context "Men's MT: " do

	# 	it "- SideNav Tag Labels" do
	# 		@page.goto "#{$base_url}men-s-custom-sandstone-jacket/38832270"
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

	# 	it "- Pricing" do
	# 		current_price = @page.price
	# 		@page.add_hood_element.click
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$279.00")
	# 		current_price = @page.price
	# 		@page.select_size
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$259.00")
	# 	end

# BODY: Dark Smoke
# SHOULDER & COLLAR/HOOD: Dark Smoke
# SLEEVES: Dark Smoke
# SIDE PANELS: Dark Smoke
# THREAD: White
# MAIN ZIPPER: White
# POCKET ZIPPER: Cinder
# ZIPPER PULLS: Cinder
# LOGOS AND MONOGRAMS: Light Grey
# CHEST MONOGRAM:  
# SLEEVE MONOGRAM:  
	# end

	# context "Women's MT: " do

	# 	it "- SideNav Tag Labels" do
	# 		@page.goto "#{$base_url}women-s-custom-sandstone-jacket/38925270"
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

	# 	it "- Pricing" do
	# 		current_price = @page.price
	# 		@page.add_hood_element.click
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$249.00")
	# 		current_price = @page.price
	# 		@page.select_size
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$269.00")
	# 	end

# BODY: Dark Smoke
# SHOULDER & COLLAR/HOOD: Dark Smoke
# SLEEVES: Dark Smoke
# SIDE PANELS: Dark Smoke
# THREAD: White
# MAIN ZIPPER: White
# POCKET ZIPPER: Cinder
# ZIPPER PULLS: Cinder
# LOGOS AND MONOGRAMS: Light Grey
# CHEST MONOGRAM:  
# SLEEVE MONOGRAM: 
	# end

	# context "Men's SS: " do

	# 	it "- SideNav Tag Labels" do
	# 		@page.goto "#{$base_url}men-s-custom-microtherm-stormdown-jacket/38832296"
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

	# 	it "- Pricing" do
	# 		current_price = @page.price
	# 		@page.add_hood_element.click
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$149.00")
	# 		current_price = @page.price
	# 		@page.select_size
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$129.00")
	# 	end
	# end

	# context "Women's SS: " do

	# 	it "- SideNav Tag Labels" do
	# 		@page.goto "#{$base_url}women-s-custom-microtherm-stormdown-jacket/38925386"
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

	# 	it "- Pricing" do
	# 		current_price = @page.price
	# 		@page.add_hood_element.click
	# 		@page.wait_while { current_price == @page.price}
	# 		expect(@page.price).to eq("$159.00")
	# 	end
	# end

	# context "API: " do
	# 	$staging_eb_products.each do |id|
	# 	it "API CALL: #{id}" do
	# 		url = "https://staging.spectrumcustomizer.com/api/recipesets/readable/#{id}"
	# 		uri = URI(url)
	# 		response = Net::HTTP.get(uri)
	# 		specs = JSON.parse(response)
	# 		puts specs
	# 	end
	# end
end