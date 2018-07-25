
describe ".describe_test" do
	before(:all) do
		puts "Running Before Block"
		puts "Before Block Complete"
	end
	context ".context_of" do 
		it ".it_should_do" do 
			BasePage.validate_svg("#{Dir.pwd}/lib/helpers/patterns.zip", "#{Dir.pwd}/lib/helpers/svg_schema.xsd")
		end
	end
end