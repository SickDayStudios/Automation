require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Packlist-Spec Test" do 

	before(:all) do
		@page = IconCustomizer.new
	end
	
	$icon_handles.each do |handle|
		it "ICON | #{ENV['ENVIRONMENT']} | #{ENV['BROWSER']} | #{handle}" do
			@page.verify_ber(handle)
		end
	end
end