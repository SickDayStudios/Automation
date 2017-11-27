require "./lib/pages/asset_api_page"

describe " :: Product Backend API Test :: " do

	before(:all) do
		@v = Array.new
		@k = Array.new
		ENV['SITE'] = "gk-elite"
	end

	after(:all) do
		mani = @k.uniq
		puts ""
		puts "#{mani.length} Assets with SceneFile['connections'] not found in Manifest"
		val = @v.uniq
		puts ""
		puts "#{val.length} Assets with SceneFile['connections'] not found in ProductData"
		puts ""
	end
	
	
	context "Product Data" do
		$gk_scene_files.each do |scene|
			it "Product Data Test: #{ENV['SITE']} :: #{scene}" do
				aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Data" do
					AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connection_values(scene)).each do |product, values|
						puts ""
						puts " - #{product}"
						product_handles = AssetAPI.product_handle_values(product)
						aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
							values.each do |sceneValue|
								if product_handles.include?(sceneValue) == false
									@v.push(product)
									puts "#{scene} :: '#{sceneValue}' Not found in Product Data"
								end
								expect(product_handles).to include(sceneValue)
							end
						end
					end
				end
			end
		end
	end

	
	context "Product Manifest" do
		$gk_scene_files.each do |scene|
			it "Manifest Data Test: #{ENV['SITE']} :: #{scene}" do
				aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Manifest" do
					AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connection_keys(scene)).each do |product, keys|
						puts ""
						puts " - #{product}"
						manifest_keys = AssetAPI.manifest_parameter_keys(product)
						aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
							keys.each do |sceneKey|
								if manifest_keys.include?(sceneKey) == false
									@k.push(product)
									puts "#{scene} :: '#{sceneKey}' Not found in Manifest"
								end
								expect(manifest_keys).to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end