require "./lib/pages/asset_api_page"

describe ":: GK-Elite Product Backend API Test ::" do
	before(:all) do
		puts ":: GK-ELITE PRODUCTS ::"
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.uniq.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.uniq.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$gk_scene_files.each do |scene|
		it "GK-Elite :: #{scene}" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "'#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "'#{sceneKey}' Not found in Product Manifest"
								end
								expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end

describe ":: Under Armour Product Backend API Test ::" do

	before(:all) do
		puts ":: UA-B2B PRODUCTS ::"
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.uniq.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'] not found in ProductData"
		end
		if @k.uniq.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end

	$uau_scene_files.each do |scene|
		it "Under-Armour :: #{scene}" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "'#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "'#{sceneKey}' Not found in Product Manifest"
								end
								expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end

describe ":: ICON Product Backend API Test ::" do

	before(:all) do
		puts ":: UA-ICON PRODUCTS ::"
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.uniq.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'] not found in ProductData"
		end
		if @k.uniq.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end

	$uaf_scene_files.each do |scene|
		it "UA-ICON :: #{scene}" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "'#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "'#{sceneKey}' Not found in Product Manifest"
								end
								expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end

describe ":: CamelBak Product Backend API Test ::" do

	before(:all) do
		puts ":: CAMELBAK PRODUCTS ::"
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.uniq.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'] not found in ProductData"
		end
		if @k.uniq.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end

	$cb_scene_files.each do |scene|
		it "CamelBak :: #{scene}" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "'#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "'#{sceneKey}' Not found in Product Manifest"
								end
								expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end

describe ":: Eddie Bauer Product Backend API Test ::" do

	before(:all) do
		puts ":: EDDIE-BAUER PRODUCTS ::"
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.uniq.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'] not found in ProductData"
		end
		if @k.uniq.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'] not found in Manifest"
			puts ""
		end
	end

	$eb_scene_files.each do |scene|
		it "Eddie-Bauer :: #{scene}" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "'#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "'#{sceneKey}' Not found in Product Manifest"
								end
								expect("#{scene} :: #{product} :: #{manifest_keys}").to include(sceneKey)
							end
						end
					end
				end
			end
		end
	end
end