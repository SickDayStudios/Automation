require "./lib/pages/gkelite/gk_asset_api_page"

describe "Backend Call: " do
	
	$gk_scene_files.each do |scene|
	context "API: #{scene}" do
			it "SceneFile Connection Values == ProductSet Feature Values? " do
				aggregate_failures "Verify SceneFile Connection Values For: " do
					GKAssetAPI.scene_productoptions_keys(scene).zip(GKAssetAPI.scene_connection_values(scene)).each do |product, values|
						puts " - Compare SceneFile Connection Values Against ProductSet Feature Values: #{product}"
						product_handles = GKAssetAPI.product_handle_values(product)
						aggregate_failures " - #{product}: ProductSet Features Do Not Contain SceneFile Connection Values For: " do
							values.each do |featureValue|
								expect(product_handles).to include(featureValue)
							end
						end
					end
				end
			end

			it "SceneFile Connection Keys == Manifest Parameter Keys? " do
				aggregate_failures "Verify SceneFile Connection Keys For: " do
					GKAssetAPI.scene_productoptions_keys(scene).zip(GKAssetAPI.scene_connection_keys(scene)).each do |product, keys|
						puts " - Compare SceneFile Connection Keys Against Manifest Parameter Keys: #{product}"
						manifest_keys = GKAssetAPI.manifest_parameter_keys(product)
						aggregate_failures " - #{product}: Manifest Parameter Keys Do Not Contain SceneFile Connection Keys For: " do
							keys.each do |sceneKey|
								expect(manifest_keys).to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end