require "./lib/pages/eb/eb_base_page"

describe "Eddie Bauer Smoke Test: " do

	before(:all) do
		BasePage.set_user
		BasePage.set_base_url
		BasePage.resize_window
		@page = EBBasePage.new
	end

	context "GUI: " do

		it "whatever" do
			@page.goto "#{$base_url}TVGDRPHZ"
			sleep 30
			@page.body_label_element.click
			@page.color_elements.each do |color|
				puts color
			end
		end
	end

	# 	it "Men's MT: SideNav Tag Labels" do
	# 		if ENV['ENVIRONMENT'] == 'staging'
	# 			@page.goto "#{$base_url}JV5FSWGX"
	# 		else
	# 			@page.goto "#{$base_url}EZLYTMXJ"
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
	# 		puts 
	# 	end

	# 	it "Women's MT: SideNav Tag Labels" do
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

	# 	it "Men's SS: SideNav Tag Labels" do
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

	# 	it "Women's SS - SideNav Tag Labels" do
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