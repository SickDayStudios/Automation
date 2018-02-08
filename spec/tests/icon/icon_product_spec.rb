require "./lib/pages/icon/icon_base_page"
require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Recipe Verification Test | " do 

	before(:all) do
		@page = IconCustomizer.new
		$driver.goto('https://www.underarmour.com/en-us/pid3000416?recipeSetId=Z47N3G68')
		sleep 10
	end

	it "Tougher, Colder, Killer" do
		shoe = @page.create_random_shoe
		puts shoe[0]
		puts shoe[1]
	end

	# it "parse_icon_recipeset" do
	# 	puts IconBasePage.parse_icon_recipeset("#{@id}")
	# end

	# it "parse_icon_packlist" do
	# 	puts IconBasePage.parse_icon_packlist("#{@id}")
	# end

	# it "parse_spec_html" do
	# 	IconBasePage.parse_spec_html("#{@id}")
	# end

	# it "get_text_message_handles" do
	# 	puts IconBasePage.get_text_message_handles("uaf-prs-curry1-mens")
	# end

	# it "localize_text_message_handles" do
	# 	puts IconBasePage.localize_text_message_handles("uaf-prs-curry1-mens")
	# end

	# it "convert_handle_to_text" do
	# 	puts IconBasePage.convert_handle_to_text("uaf-prs-curry1-mens","#{@id}")
	# end
end