require "./lib/pages/eb/eb_base_page"

describe "Eddie Bauer Smoke Test: " do

	before(:all) do
		BasePage.set_user
		BasePage.set_base_url
		
		@page = EBBasePage.new
	end

	

	context "Men's MT: " do

		it "- SideNav Tag Labels" do
			@page.goto "#{$base_url}men-s-custom-sandstone-jacket/38832270"
			expect(@page.hood_label).to include("HOOD ($30)")
			expect(@page.body_label).to include("BODY")
			expect(@page.shoulder_collar_hood_label).to include("SHOULDER & COLLAR/HOOD")
			expect(@page.sleeves_label).to include("SLEEVES")
			expect(@page.stretch_panel_label).to include("STRETCH PANELS")
			expect(@page.zipper_label).to include("MAIN ZIPPER")
			expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
			expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
			expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
			expect(@page.interior_lining_label).to include("INTERIOR LINING")
			expect(@page.interior_label).to include("INTERIOR LABEL")
			expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
			expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
			expect(@page.size_label).to include("SIZE")
		end

		it "- Color Options" do
			expect(@page.product_color_options).to match_array($mt_mens)
		end

		it "- Add Hood / Monograms / Sizing" do
			@page.add_hood_element.click
			@page.select_size
			@page.input_value_one_element.click
			@page.add_interior_label = "TEST"
			@page.input_value_two_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
			@page.input_value_three_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
		end

		it "- Cart Popup" do
			@page.add_to_bag_element.click
			@page.wait_until { @page.cart_popup? }
			expect(@page.price).to include("$189.00")
			expect(@page.body).to include("Dark Smoke")
			expect(@page.collar_hood).to include("Dark Smoke")
			expect(@page.sleeves).to include("Dark Smoke")
			expect(@page.stretch_panel).to include("Dark Smoke")
			expect(@page.main_zipper).to include("White")
			expect(@page.pocket_zipper).to include("White")
			expect(@page.zipper_pull).to include("Cinder")
			expect(@page.logos).to include("Cinder")
			expect(@page.lining).to include("Light Grey")
			expect(@page.label).to include("TEST")
			expect(@page.monogram_one).to include("TEST TEST")
			expect(@page.monogram_two).to include("TEST TEST")
		end  
	end

	context "Women's MT: " do

		it "- SideNav Tag Labels" do
			@page.goto "#{$base_url}women-s-custom-sandstone-jacket/38925270"
			expect(@page.hood_label).to include("HOOD ($30)")
			expect(@page.body_label).to include("BODY")
			expect(@page.sleeves_shoulder_hood_label).to include("SLEEVES & COLLAR/HOOD")
			expect(@page.stretch_panel_label).to include("STRETCH PANELS")
			expect(@page.side_panels_label).to include("SIDE PANELS")
			expect(@page.zipper_label).to include("MAIN ZIPPER")
			expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
			expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
			expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
			expect(@page.interior_lining_label).to include("INTERIOR LINING")
			expect(@page.interior_label).to include("INTERIOR LABEL")
			expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
			expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
			expect(@page.size_label).to include("SIZE")
		end

		it "- Color Options" do
			expect(@page.product_color_options).to match_array($mt_womens)
		end

		it "- Add Hood / Monograms / Sizing" do
			@page.add_hood_element.click
			@page.select_size
			@page.input_value_one_element.click
			@page.add_interior_label = "TEST"
			@page.input_value_two_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
			@page.input_value_three_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
		end

		it "- Cart Popup" do
			@page.add_to_bag_element.click
			@page.wait_until { @page.cart_popup? }
			expect(@page.price).to include("$189.00")
			expect(@page.body).to include("Dark Smoke")
			expect(@page.collar_hood).to include("Dark Smoke")
			expect(@page.sleeves).to include("Dark Smoke")
			expect(@page.stretch_panel).to include("Dark Smoke")
			expect(@page.main_zipper).to include("White")
			expect(@page.pocket_zipper).to include("White")
			expect(@page.zipper_pull).to include("Cinder")
			expect(@page.logos).to include("Cinder")
			expect(@page.lining).to include("Light Grey")
			expect(@page.label).to include("TEST")
			expect(@page.monogram_one).to include("TEST TEST")
			expect(@page.monogram_two).to include("TEST TEST")
		end 
	end

	context "Men's SS: " do

		it "- SideNav Tag Labels" do
			@page.goto "#{$base_url}men-s-custom-microtherm-stormdown-jacket/38832296"
			expect(@page.hood_label).to include("HOOD ($30)")
			expect(@page.body_label).to include("BODY")
			expect(@page.shoulder_collar_hood_label).to include("SHOULDER & COLLAR/HOOD")
			expect(@page.sleeves_label).to include("SLEEVES")
			expect(@page.side_panels_label).to include("SIDE PANELS")
			expect(@page.thread_label).to include("THREAD")
			expect(@page.zipper_label).to include("MAIN ZIPPER")
			expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
			expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
			expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
			expect(@page.interior_label).to include("INTERIOR LABEL")
			expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
			expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
			expect(@page.size_label).to include("SIZE")
		end

		it "- Color Options" do
			expect(@page.product_color_options).to match_array($ss_mens)
		end

		it "- Add Hood / Monograms / Sizing" do
			@page.add_hood_element.click
			@page.select_size
			@page.input_value_one_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
			@page.input_value_two_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
		end

		it "- Cart Popup" do
			@page.add_to_bag_element.click
			@page.wait_until { @page.cart_popup? }
			expect(@page.price).to include("$309.00")
			expect(@page.body).to include("Silver")
			expect(@page.collar_hood).to include("Silver")
			expect(@page.sleeves).to include("Silver")
			expect(@page.stretch_panel).to include("Cinder")
			expect(@page.main_zipper).to include("Silver")
			expect(@page.pocket_zipper).to include("Silver")
			expect(@page.zipper_pull).to include("Silver")
			expect(@page.logos).to include("Light Grey")
			expect(@page.lining).to include("Silver")
			expect(@page.monogram_one).to include("TEST TEST")
			expect(@page.monogram_two).to include("TEST TEST")
		end 
	end

	context "Women's SS: " do

		it "- SideNav Tag Labels" do
			@page.goto "#{$base_url}women-s-custom-microtherm-stormdown-jacket/38925386"
			expect(@page.hood_label).to include("HOOD ($30)")
			expect(@page.body_label).to include("BODY")
			expect(@page.shoulder_collar_hood_label).to include("SHOULDER & COLLAR/HOOD")
			expect(@page.sleeves_label).to include("SLEEVES")
			expect(@page.side_panels_label).to include("SIDE PANELS")
			expect(@page.thread_label).to include("THREAD")
			expect(@page.zipper_label).to include("MAIN ZIPPER")
			expect(@page.pocket_zipper_label).to include("POCKET ZIPPERS")
			expect(@page.zipper_pull_label).to include("ZIPPER PULLS")
			expect(@page.logos_label).to include("LOGOS AND MONOGRAMS")
			expect(@page.interior_label).to include("INTERIOR LABEL")
			expect(@page.chest_monogram_label).to include("ADD CHEST MONOGRAM")
			expect(@page.sleeve_monogram_label).to include("ADD SLEEVE MONOGRAM")
			expect(@page.size_label).to include("SIZE")
		end

		it "- Color Options" do
			expect(@page.product_color_options).to match_array($ss_womens)
		end

		it "- Add Hood / Monograms / Sizing" do
			@page.add_hood_element.click
			@page.select_size
			@page.input_value_one_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
			@page.input_value_two_element.click
			@page.monogram_line_one = "TEST"
			@page.monogram_line_two = "TEST"
		end

		it "- Cart Popup" do
			@page.add_to_bag_element.click
			@page.wait_until { @page.cart_popup? }
			expect(@page.price).to include("$309.00")
			expect(@page.body).to include("Silver")
			expect(@page.collar_hood).to include("Silver")
			expect(@page.sleeves).to include("Silver")
			expect(@page.stretch_panel).to include("Cinder")
			expect(@page.main_zipper).to include("Silver")
			expect(@page.pocket_zipper).to include("Silver")
			expect(@page.zipper_pull).to include("Silver")
			expect(@page.logos).to include("Light Grey")
			expect(@page.lining).to include("Silver")
			expect(@page.monogram_one).to include("TEST TEST")
			expect(@page.monogram_two).to include("TEST TEST")
		end  
	end

	# context "API: " do
	# 	$staging_eb_products.each do |id|
	# 		it "API CALL: #{id}" do
	# 			url = "https://staging.spectrumcustomizer.com/api/recipesets/readable/#{id}"
	# 			uri = URI(url)
	# 			response = Net::HTTP.get(uri)
	# 			specs = JSON.parse(response)
	# 			puts specs
	# 		end
	# 	end
	end