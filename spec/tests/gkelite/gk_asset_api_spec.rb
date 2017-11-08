require "./lib/pages/gkelite/gk_asset_api_page"

describe "Backend Call: " do

	before(:all) do
	end
	
	context "API: " do

		it "SceneFile Values / Product Data Values" do
			aggregate_failures "Verify Values" do
				GKAssetAPI.scene_productoptions_keys.zip(GKAssetAPI.scene_connection_values).each do |product, values|
					puts " - Compare Values: #{product}"
					handles = GKAssetAPI.product_handle_values(product)
					aggregate_failures " - Compare Values: #{product}" do
						values.each do |string|
							expect(handles).to include(string)
						end
					end
				end
			end
		end

		it "SceneFile Keys / Product Manifest Keys" do
			aggregate_failures "Verify Values" do
				GKAssetAPI.scene_productoptions_keys.zip(GKAssetAPI.scene_connection_keys).each do |product, values|
					puts " - Compare Keys: #{product}"
					handles = GKAssetAPI.manifest_parameter_keys(product)
					aggregate_failures " - Compare Keys: #{product}" do
						values.each do |string|
							expect(handles).to include(string)
						end
					end
				end
			end
		end
	end
end