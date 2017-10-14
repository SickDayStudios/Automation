require "./lib/pages/eb/eb_base_page"

describe "Eddie Bauer Smoke Test: " do

	before(:all) do
		# BasePage.setup
		# @page = EBBasePage.new
	end

	context "GUI: " do

		it "Test SideNav Tag Labels" do
			expect(@page.hood_label).to include("HOOD")
			expect(@page.body_label).to include("Body")
			expect(@page.sleeves_shoulder_hood_label).to include("Sleeves & Collar/Hood")
			expect(@page.shoulder_collar_hood_label).to include("Shoulder & Collar/Hood")
			expect(@page.sleeves_label).to include("Sleeves")
			expect(@page.stretch_panel_label).to include("Stretch Panels")
			expect(@page.side_panels_label).to include("Side Panels")
			expect(@page.thread_label).to include("Thread")
			expect(@page.zipper_label).to include("Main Zipper")
			expect(@page.pocket_zipper_label).to include("Pocket Zippers")
			expect(@page.zipper_pull_label).to include("Zipper Pulls")
			expect(@page.logos_label).to include("Logos and Monograms")
			expect(@page.interior_label).to include("Interior Label")
			expect(@page.chest_monogram_label).to include("Add Chest Monogram")
			expect(@page.sleeve_monogram_label).to include("Add Sleeve Monogram")
			expect(@page.size_label).to include("Size")
		end


	end

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