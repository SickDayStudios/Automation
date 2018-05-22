require "./lib/pages/gkelite/gk_product_page"
require "./lib/pages/gkelite/gk_login_page"
require "./lib/pages/gkelite/gk_home_page"


describe "#{ENV['SITE'].upcase} | #{ENV['ENVIRONMENT'].upcase} | #{ENV['BROWSER'].upcase} - GK Spec Test" do

	before(:all) do
		@page = GKShopifyBasePage.new
	end


# gk-vg-a0maps    GK A0 Mappings
# gk-vg-embellishment-locations    GK Embellishment Locations
# gk-vg-fabric-codes    GK Fabric Codes
# gk-vg-color-codes    GK Color Codes
# gk-vg-ombre-styles    GK Ombre Style Numbers
# gk-vg-gradient-codes    GK Gradient Codes
# gk-vg-specification-replacements    GK Automatic Specification Replacement Strings
# gk-vg-jewel-pattern-codes    GK Jewel Pattern Codes

	
	it "-------------------------------------------" do
		@vgroup = @page.spec_data('gk-vg-embellishment-locations')
		puts @vgroup
	end

end