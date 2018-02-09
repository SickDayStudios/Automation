require "./lib/pages/icon/icon_base_page"
require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Recipe Verification Test | " do 

	before(:all) do
		@page = IconCustomizer.new
	end


	
	it "Tougher, Colder, Killer" do
		$icon.each do |style|
			$driver.goto("http://demo.madetoordercustomizer.com/under-armour/test/uaf/frontend/index.html?style=#{style}")
			sleep 10
			shoe = @page.create_random_shoe
			puts style
			puts shoe[0]
			puts shoe[1]
		end
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