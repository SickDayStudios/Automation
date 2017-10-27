require "./lib/pages/gkelite/gk_asset_api_page"

describe "" do

	before(:all) do
		@page = GKAssetAPI.new
	end
	
	context "" do

		it "" do
			@page.scene_productgroups_keys
			@page.scene_connection_keys
		end

	end

end