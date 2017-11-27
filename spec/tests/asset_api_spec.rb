require "./lib/pages/asset_api_page"

describe " :: GK-Elite Product Backend API Test :: " do
	before(:all) do
		@v = Array.new
		@k = Array.new
		ENV['SITE'] = "gk-elite"
	end

	$gk_scene_files.each do |scene|
		it "#{ENV['SITE']} :: #{scene}" do
			aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Data and Manifest" do
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						pairs.each do |sceneKey, sceneValue|
							if product_handles.include?(sceneValue) == false
								@v.push(product)
								puts "#{scene} :: '#{sceneValue}' Not found in Product Data"
							end
							if manifest_keys.include?(sceneKey) == false
								@k.push(product)
								puts "#{scene} :: '#{sceneKey}' Not found in Manifest"
							end
							expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
							expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
						end
					end
				end
			end
			val = @v.uniq
			puts ""
			puts "#{ENV['SITE']} :: #{scene} :: #{val.length} Assets with SceneFile['connections'] not found in ProductData"
			puts ""
			mani = @k.uniq
			puts "#{ENV['SITE']} :: #{scene} :: #{mani.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end
end

describe " :: Under Armour Product Backend API Test :: " do

	before(:all) do
		@v = Array.new
		@k = Array.new
		ENV['SITE'] = "under-armour"
	end

	$uau_scene_files.each do |scene|
		it "#{ENV['SITE']} :: #{scene}" do
			aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Data and Manifest" do
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - Asset: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						pairs.each do |sceneKey, sceneValue|
							if product_handles.include?(sceneValue) == false
								@v.push(product)
								puts "#{scene} :: '#{sceneValue}' Not found in Product Data"
							end
							if manifest_keys.include?(sceneKey) == false
								@k.push(product)
								puts "#{scene} :: '#{sceneKey}' Not found in Manifest"
							end
							expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
							expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
						end
					end
				end
			end
			val = @v.uniq
			puts ""
			puts "#{ENV['SITE']} :: #{scene} :: #{val.length} Assets with SceneFile['connections'] not found in ProductData"
			puts ""
			mani = @k.uniq
			puts "#{ENV['SITE']} :: #{scene} :: #{mani.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end
end

describe " :: ICON Product Backend API Test :: " do

	before(:all) do
		@v = Array.new
		@k = Array.new
		ENV['SITE'] = "ua-icon"
	end

	$uaf_scene_files.each do |scene|
		it "#{ENV['SITE']} :: #{scene}" do
			aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Data and Manifest" do
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - Asset: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						pairs.each do |sceneKey, sceneValue|
							if product_handles.include?(sceneValue) == false
								@v.push(product)
								puts "#{scene} :: '#{sceneValue}' Not found in Product Data"
							end
							if manifest_keys.include?(sceneKey) == false
								@k.push(product)
								puts "#{scene} :: '#{sceneKey}' Not found in Manifest"
							end
							expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
							expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
						end
					end
				end
			end
			val = @v.uniq
			puts ""
			puts "#{ENV['SITE']} :: #{scene} :: #{val.length} Assets with SceneFile['connections'] not found in ProductData"
			puts ""
			mani = @k.uniq
			puts "#{ENV['SITE']} :: #{scene} :: #{mani.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end
end

describe " :: CamelBak Product Backend API Test :: " do

	before(:all) do
		@v = Array.new
		@k = Array.new
		ENV['SITE'] = "camelbak"
	end

	$cb_scene_files.each do |scene|
		it "#{ENV['SITE']} :: #{scene}" do
			aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Data and Manifest" do
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - Asset: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						pairs.each do |sceneKey, sceneValue|
							if product_handles.include?(sceneValue) == false
								@v.push(product)
								puts "#{scene} :: '#{sceneValue}' Not found in Product Data"
							end
							if manifest_keys.include?(sceneKey) == false
								@k.push(product)
								puts "#{scene} :: '#{sceneKey}' Not found in Manifest"
							end
							expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
							expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
						end
					end
				end
			end
			val = @v.uniq
			puts ""
			puts "#{ENV['SITE']} :: #{scene} :: #{val.length} Assets with SceneFile['connections'] not found in ProductData"
			puts ""
			mani = @k.uniq
			puts "#{ENV['SITE']} :: #{scene} :: #{mani.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end
end

describe " :: Eddie Bauer Product Backend API Test :: " do

	before(:all) do
		@v = Array.new
		@k = Array.new
		ENV['SITE'] = "eddie-bauer"
	end

	$eb_scene_files.each do |scene|
		it "#{ENV['SITE']} :: #{scene}" do
			aggregate_failures "Verify each SceneFile Product 'connections' exist in associated Product Data and Manifest" do
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - Asset: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						pairs.each do |sceneKey, sceneValue|
							if product_handles.include?(sceneValue) == false
								@v.push(product)
								puts "#{scene} :: '#{sceneValue}' Not found in Product Data"
							end
							if manifest_keys.include?(sceneKey) == false
								@k.push(product)
								puts "#{scene} :: '#{sceneKey}' Not found in Manifest"
							end
							expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
							expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
						end
					end
				end
			end
			val = @v.uniq
			puts ""
			puts "#{ENV['SITE']} :: #{scene} :: #{val.length} Assets with SceneFile['connections'] not found in ProductData"
			puts ""
			mani = @k.uniq
			puts "#{ENV['SITE']} :: #{scene} :: #{mani.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end
end