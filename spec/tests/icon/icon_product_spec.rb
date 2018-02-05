require "./lib/pages/icon/icon_base_page"

describe "ICON | Recipe Verification Test | " do 

	before(:all) do
	end

	it "parse_icon_recipeset" do
		puts IconBasePage.parse_icon_recipeset("2DKDKWP6")
	end

	it "parse_icon_packlist" do
		puts IconBasePage.parse_icon_packlist("2DKDKWP6")
	end

	it "parse_spec_html" do
		IconBasePage.parse_spec_html("2DKDKWP6")
	end

	it "get_text_message_handles" do
		puts IconBasePage.get_text_message_handles("uaf-prs-clutchfit-mens")
	end

	it "localize_text_message_handles" do
		puts IconBasePage.localize_text_message_handles("uaf-prs-clutchfit-mens")
	end

	it "convert_handle_to_text" do
		puts IconBasePage.convert_handle_to_text("uaf-prs-clutchfit-mens","2DKDKWP6")
	end
end