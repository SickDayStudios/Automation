require "./lib/pages/gkelite/customizer_page"
# require "./lib/helpers/deferred_garbage_collection"


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GK Cheer 3D Customizer Test: " do

	before(:all) do
		# DeferredGarbageCollection.start
		@page = CustomizerPage.new
		BasePage.set_base_url
    	BasePage.resize_window
	end

	# after(:each) do
	# 	DeferredGarbageCollection.reconsider
	# end

	context "Cheer Customizer Page Test: " do
		$gk_cheer_products.each do |id|
			it "Test Complete: #{id}" do
				puts ""
				puts "Test Start: #{id}"
				@page.goto "#{$base_url}#{id}/design"
				@page.goto "#{$base_url}#{id}/design"
				@page.wait_until(60) { @page.spinner_precentage == "100%" }
				@page.wait_until { @page.page_load_element.present? }
				sleep 8
				BasePage.print_js_warnings
			end
		end
	end
end