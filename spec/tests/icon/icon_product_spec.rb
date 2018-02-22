require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Recipe Verification Test" do 

	before(:all) do
		@page = IconCustomizer.new
	end


	
	it "iCON" do
		# $icon.each do |style|
		# 	$driver.goto("https://staging.underarmour.com/en-us/#{style}")
		# 	shoe = @page.create_random_shoe
		# 	recipe_id = shoe[0][0]
		# 	puts recipe_id
		# 	product_handle = shoe[1][0]
		# 	color_options = shoe[2]
		# 	recipe_data = shoe[3]
			product_handle = "uaf-prs-drive4-mens"
			recipe_id = "Y252D93K"
			recipe_set = IconBasePage.convert_handle_to_text(product_handle,recipe_id)
			spec = IconBasePage.parse_spec_html(recipe_id)
			packlist = IconBasePage.parse_icon_packlist(recipe_id)
			puts "Color Options :\n#{color_options}"
			puts "Recipe Data :\n#{recipe_data}"
			puts "Packlist :\n#{packlist}"
			puts "Spec Details :\n#{spec[0]}"
			puts "Spec Images :\n#{spec[1]}"
			puts "Spec Colors :\n#{spec[2]}"
			puts "Recipe Set :\n#{recipe_set}"
		# end
	end

	# it "parse_icon_recipeset" do
		
	# end

	# it "parse_icon_packlist" do
		
	# end

	# it "parse_spec_html" do
		
	# end

	# it "convert_handle_to_text" do
		
	# end
end