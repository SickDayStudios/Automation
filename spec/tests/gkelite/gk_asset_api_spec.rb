require "./lib/pages/gkelite/gk_asset_api_page"

describe "" do

	before(:all) do
		@page = GKAssetAPI.new
	end
	
	context "" do

		it "" do
			puts @page.scene_productgroups_keys
			puts ""
			puts @page.scene_productoptions_keys
			puts ""
			puts @page.scene_connection_keys(@page.scene_productgroups_keys, @page.scene_productoptions_keys)
		end

	end

end