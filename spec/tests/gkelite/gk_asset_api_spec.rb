require "./lib/pages/gkelite/gk_asset_api_page"

describe "" do

	before(:all) do
		@page = GKAssetAPI.new
	end
	
	context "" do

		it "" do
			# @page.scene_productgroups_keys
			# puts @page.scene_connection_keys
			# puts "values:"
			# puts @page.scene_connection_values
			@page.product_handle_keys
		end

	end

end