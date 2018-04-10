require "./lib/pages/gkelite/gk_shopify_base_page"

describe ".describe_test" do
	before(:all) do
		puts "Running Before Block"
		puts "Before Block Complete"
	end
	context ".context_of" do 
		# it ".it_should_do" do 
		# 	BasePage.validate_svg("#{Dir.pwd}/lib/helpers/patterns.zip", "#{Dir.pwd}/lib/helpers/svg_schema.xsd")
		# end

		it ".it_should_do" do
			$gk_svg_urls.each do |url|
				BasePage.validate_svg_url("#{url}", "#{Dir.pwd}/lib/helpers/gk_svg_schema.xsd")
			end
		end
	end
end