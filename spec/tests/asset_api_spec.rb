require "./lib/pages/asset_api_page"


describe ":: GK-Elite Product Backend API Test ::" do

	before(:all) do
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
			puts ""
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$gk_scene_files.each do |scene|
		it "GK-Elite :: #{scene} :: Test Complete" do
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
									expect("#{scene} :: #{product} :: #{manifest_values}").to include(sceneValue)
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


describe ":: Benchmade Product Backend API Test ::" do

	before(:all) do
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
			puts ""
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$bm_scene_files.each do |scene|
		it "BENCHMADE :: #{scene} :: Test Complete" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					puts product_handles
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
										expect(manifest_values).to include(sceneValue)
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "'#{sceneValue}' Not found in Product Data"
										expect(product_handles).to include(sceneValue)
									end
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "'#{sceneKey}' Not found in Product Manifest"
									expect(manifest_keys).to include(sceneKey)
								end
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
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
			puts ""
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$uau_scene_files.each do |scene|
		it "Under-Armour :: #{scene} :: Test Complete" do
						aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
									if mobile_manifest_values.nil?
									else
										if mobile_manifest_values.include?(sceneValue) == false
											puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product mobileManifest['parameter']"
										end
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in Manifest"
								end
								if mobile_manifest_values.nil?
								else
									if mobile_manifest_keys.include?(sceneKey) == false
										@k.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in mobileManifest"
									end
									expect("#{scene} :: #{product} :: #{mobile_manifest_keys}").to include(sceneKey)
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
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
			puts ""
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$uaf_scene_files.each do |scene|
		it "UA-ICON :: #{scene} :: Test Complete" do
			aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
									if mobile_manifest_values.nil?
									else
										if mobile_manifest_values.include?(sceneValue) == false
											puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product mobileManifest['parameter']"
										end
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in Manifest"
								end
								if mobile_manifest_values.nil?
								else
									if mobile_manifest_keys.include?(sceneKey) == false
										@k.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in mobileManifest"
									end
									expect("#{scene} :: #{product} :: #{mobile_manifest_keys}").to include(sceneKey)
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
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
			puts ""
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$cb_scene_files.each do |scene|
		it "CamelBak :: #{scene} :: Test Complete" do
						aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
									if mobile_manifest_values.nil?
									else
										if mobile_manifest_values.include?(sceneValue) == false
											puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product mobileManifest['parameter']"
										end
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in Manifest"
								end
								if mobile_manifest_values.nil?
								else
									if mobile_manifest_keys.include?(sceneKey) == false
										@k.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in mobileManifest"
									end
									expect("#{scene} :: #{product} :: #{mobile_manifest_keys}").to include(sceneKey)
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
		@v = Array.new
		@k = Array.new
	end

	after(:all) do
		if @v.nil?
			puts ""
			puts ">>  0 Product Data discrepancies found!!"
		else
			puts ""
			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in ProductData"
		end
		if @k.nil?
			puts ""
			puts ">>  0 Manifest Data discrepancies found!!"
			puts ""
		else
			puts ""
			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
			puts ""
		end
	end

	$eb_scene_files.each do |scene|
		it "Eddie-Bauer :: #{scene} :: Test Complete" do
						aggregate_failures "Verify #{scene} Product 'connections' exist in associated Product Data and Manifest" do
				manifest = AssetAPI.scene_manifest_url(scene)
				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
					puts ""
					puts " - #{scene} :: #{product}"
					product_handles = AssetAPI.product_handle_values(product)
					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
					aggregate_failures "#{ENV['SITE']} :: #{scene} :: #{product}" do
						if pairs.nil?
						else
							pairs.each do |sceneKey, sceneValue|
								if sceneValue.is_a? Array
									if manifest_values.include?(sceneValue) == false
										puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product Manifest['parameter']"
									end
									if mobile_manifest_values.nil?
									else
										if mobile_manifest_values.include?(sceneValue) == false
											puts "#{sceneKey} : ['#{sceneValue}'] Does not match any Product mobileManifest['parameter']"
										end
									end
								else
									if product_handles.include?(sceneValue) == false
										@v.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneValue}' Not found in Product Data"
									end
									expect("#{scene} :: #{product} :: #{product_handles}").to include(sceneValue)
								end
								if manifest_keys.include?(sceneKey) == false
									@k.push("#{ENV['SITE']}:#{scene}:#{product}")
									puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in Manifest"
								end
								if mobile_manifest_values.nil?
								else
									if mobile_manifest_keys.include?(sceneKey) == false
										@k.push("#{ENV['SITE']}:#{scene}:#{product}")
										puts "#{ENV['SITE']}:#{scene}:#{product}: '#{sceneKey}' Not found in mobileManifest"
									end
									expect("#{scene} :: #{product} :: #{mobile_manifest_keys}").to include(sceneKey)
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