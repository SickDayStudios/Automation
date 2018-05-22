require "./lib/pages/asset_api_page"

describe "SceneFile Connections Test" do

	before(:all) do 
		BasePage.create_csv
	end

# 	describe "| Client: ShedRain |" do

# 		before(:each) do
# 			@v = Array.new
# 			@k = Array.new
# 		end

# 		after(:each) do
# 			if @v.nil?
# 				puts ""
# 				puts ">>  0 Discrepancies found in Product Data Connections"
# 			else
# 				puts ""
# 				puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
# 			end
# 			if @k.nil?
# 				puts ""
# 				puts ">>  0 Discrepancies found in Manifest Data"
# 				puts ""
# 			else
# 				puts ""
# 				puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
# 				puts ""
# 			end
# 		end

# 		$sr_scene_files.each do |scene|
# 			it "ShedRain | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
# 				aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
# 					manifest = AssetAPI.scene_manifest_url(scene)
# 					mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
# 					AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
# 						@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
# 						@description = Array.new
# 						puts ""
# 						puts " - #{ENV['SITE']} | #{scene} | #{product}"
# 						product_handles = AssetAPI.product_handle_values(product)
# 						manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
# 						mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
# 						manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
# 						mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
# 						aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
# 							if pairs.nil?
# 							else
# 								pairs.each do |sceneKey, sceneValue|
# 									if sceneValue.is_a? Array
# 									else
# 										if product_handles.include?(sceneValue) == false
# 											puts "'#{sceneValue}' Not found in Product Data"
# 											@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
# 											@v.push("#{ENV['SITE']} | #{scene} | #{product}")
# 											expect(product_handles).to include(sceneValue)
# 										end
# 									end
# 									if mobile_manifest_values.nil?
# 									else
# 										if mobile_manifest_keys.include?(sceneKey) == false
# 											puts "'#{sceneKey}' Not found in mobileManifest Parameters"
# 											@description.push("Manifest Missing Parameter: '#{sceneKey}")
# 											@k.push("#{ENV['SITE']} | #{scene} | #{product}")
# 											expect(mobile_manifest_keys).to include(sceneKey)
# 										end
# 									end
# 									if manifest_keys.include?(sceneKey) == false
# 										puts "'#{sceneKey}' Not found in Product Manifest Parameters"
# 										@description.push("Manifest Missing Parameter: '#{sceneKey}")
# 										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
# 										expect(manifest_keys).to include(sceneKey)
# 									end
# 								end
# 								if @description.empty?
# 								else
# 									@desc = @description.join("\n")
# 									BasePage.update_csv(@summary,@desc)
# 								end
# 							end
# 						end
# 					end
# 				end
# 			end
# 		end
# 	end

	# describe "| Client: GK-Elite |" do

	# 	before(:all) do
	# 		@v = Array.new
	# 		@k = Array.new
	# 	end

	# 	after(:all) do
	# 		if @v.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Product Data Connections!!"
	# 		else
	# 			puts ""
	# 			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
	# 		end
	# 		if @k.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Manifest Data!!"
	# 			puts ""
	# 		else
	# 			puts ""
	# 			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
	# 			puts ""
	# 		end
	# 	end

	# 	$gk_scene_files.each do |scene|
	# 		it "GK-Elite | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
	# 			aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
	# 				manifest = AssetAPI.scene_manifest_url(scene)
	# 				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
	# 				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
	# 					@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
	# 					@description = Array.new
	# 					puts ""
	# 					puts " - #{ENV['SITE']} | #{scene} | #{product}"
	# 					product_handles = AssetAPI.product_handle_values(product)
	# 					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
	# 					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
	# 					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
	# 					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
	# 					aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
	# 						if pairs.nil?
	# 						else
	# 							pairs.each do |sceneKey, sceneValue|
	# 								if sceneValue.is_a? Array
	# 								else
	# 									if product_handles.include?(sceneValue) == false
	# 										puts "'#{sceneValue}' Not found in Product Data"
	# 										@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
	# 										@v.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(product_handles).to include(sceneValue)
	# 									end
	# 								end
	# 								if mobile_manifest_values.nil?
	# 								else
	# 									if mobile_manifest_keys.include?(sceneKey) == false
	# 										puts "'#{sceneKey}' Not found in mobileManifest Parameters"
	# 										@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(mobile_manifest_keys).to include(sceneKey)
	# 									end
	# 								end
	# 								if manifest_keys.include?(sceneKey) == false
	# 									puts "'#{sceneKey}' Not found in Product Manifest Parameters"
	# 									@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 									@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 									expect(manifest_keys).to include(sceneKey)
	# 								end
	# 							end
	# 							if @description.nil?
	# 							else
	# 								@desc = @description.join("\n")
	# 								BasePage.update_csv(@summary,@desc)
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end


	# describe "| Client: Benchmade |" do

	# 	before(:all) do
	# 		@v = Array.new
	# 		@k = Array.new
	# 	end

	# 	after(:all) do
	# 		if @v.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Product Data Connections!!"
	# 		else
	# 			puts ""
	# 			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
	# 		end
	# 		if @k.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Manifest Data!!"
	# 			puts ""
	# 		else
	# 			puts ""
	# 			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
	# 			puts ""
	# 		end
	# 	end

	# 	$bm_scene_files.each do |scene|
	# 		it "BENCHMADE | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
	# 			aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
	# 				manifest = AssetAPI.scene_manifest_url(scene)
	# 				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
	# 				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
	# 					@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
	# 					@description = Array.new
	# 					puts ""
	# 					puts " - #{ENV['SITE']} | #{scene} | #{product}"
	# 					product_handles = AssetAPI.product_handle_values(product)
	# 					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
	# 					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
	# 					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
	# 					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
	# 					aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
	# 						if pairs.nil? || pairs.include?("dummy")
	# 						else
	# 							pairs.each do |sceneKey, sceneValue|
	# 								if sceneValue.is_a? Array
	# 								else
	# 									if product_handles.include?(sceneValue) == false
	# 										puts "'#{sceneValue}' Not found in Product Data"
	# 										@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
	# 										@v.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(product_handles).to include(sceneValue)
	# 									end
	# 								end
	# 								if mobile_manifest_values.nil?
	# 								else
	# 									if mobile_manifest_keys.include?(sceneKey) == false
	# 										puts "'#{sceneKey}' Not found in mobileManifest Parameters"
	# 										@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(mobile_manifest_keys).to include(sceneKey)
	# 									end
	# 								end
	# 								if manifest_keys.include?(sceneKey) == false
	# 									puts "'#{sceneKey}' Not found in Product Manifest Parameters"
	# 									@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 									@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 									expect(manifest_keys).to include(sceneKey)
	# 								end
	# 							end
	# 							if @description.nil?
	# 							else
	# 								@desc = @description.join("\n")
	# 								BasePage.update_csv(@summary,@desc)
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end

	describe "| Client: Under Armour |" do

		before(:all) do
			@v = Array.new
			@k = Array.new
		end

		after(:all) do
			if @v.nil?
				puts ""
				puts ">>  0 Discrepancies found in Product Data Connections!!"
			else
				puts ""
				puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
			end
			if @k.nil?
				puts ""
				puts ">>  0 Discrepancies found in Manifest Data!!"
				puts ""
			else
				puts ""
				puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
				puts ""
			end
		end

		$uau_scene_files.each do |scene|
			it "Under-Armour | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
				aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
					manifest = AssetAPI.scene_manifest_url(scene)
					mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
						@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
						@description = Array.new
						puts ""
						puts " - #{ENV['SITE']} | #{scene} | #{product}"
						product_handles = AssetAPI.product_handle_values(product)
						manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
						mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
						manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
						mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
						aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
							if pairs.nil?
							else
								pairs.each do |sceneKey, sceneValue|
									if sceneValue.is_a? Array
									else
										if product_handles.include?(sceneValue) == false
											puts "'#{sceneValue}' Not found in Product Data"
											@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
											@v.push("#{ENV['SITE']} | #{scene} | #{product}")
											expect(product_handles).to include(sceneValue)
										end
									end
									if mobile_manifest_values.nil?
									else
										if mobile_manifest_keys.include?(sceneKey) == false
											puts "'#{sceneKey}' Not found in mobileManifest Parameters"
											@description.push("Manifest Missing Parameter: '#{sceneKey}")
											@k.push("#{ENV['SITE']} | #{scene} | #{product}")
											expect(mobile_manifest_keys).to include(sceneKey)
										end
									end
									if manifest_keys.include?(sceneKey) == false
										puts "'#{sceneKey}' Not found in Product Manifest Parameters"
										@description.push("Manifest Missing Parameter: '#{sceneKey}")
										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
										expect(manifest_keys).to include(sceneKey)
									end
								end
								if @description.nil?
								else
									@desc = @description.join("\n")
									BasePage.update_csv(@summary,@desc)
								end
							end
						end
					end
				end
			end
		end
	end

	# describe "| Client: ICON |" do

	# 	before(:all) do
	# 		@v = Array.new
	# 		@k = Array.new
	# 	end

	# 	after(:all) do
	# 		if @v.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Product Data Connections!!"
	# 		else
	# 			puts ""
	# 			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
	# 		end
	# 		if @k.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Manifest Data!!"
	# 			puts ""
	# 		else
	# 			puts ""
	# 			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
	# 			puts ""
	# 		end
	# 	end

	# 	$uaf_scene_files.each do |scene|
	# 		it "UA-ICON | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
	# 			aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
	# 				manifest = AssetAPI.scene_manifest_url(scene)
	# 				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
	# 				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
	# 					@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
	# 					@description = Array.new
	# 					puts ""
	# 					puts " - #{ENV['SITE']} | #{scene} | #{product}"
	# 					product_handles = AssetAPI.product_handle_values(product)
	# 					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
	# 					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
	# 					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
	# 					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
	# 					aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
	# 						if pairs.nil?
	# 						else
	# 							pairs.each do |sceneKey, sceneValue|
	# 								if sceneValue.kind_of?(Array)
	# 								else
	# 									if product_handles.include?(sceneValue) == false
	# 										puts "'#{sceneValue}' Not found in Product Data"
	# 										@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
	# 										@v.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(product_handles).to include(sceneValue)
	# 									end
	# 								end
	# 								if mobile_manifest_values.nil?
	# 								else
	# 									if mobile_manifest_keys.include?(sceneKey) == false
	# 										puts "'#{sceneKey}' Not found in mobileManifest Parameters"
	# 										@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(mobile_manifest_keys).to include(sceneKey)
	# 									end
	# 								end
	# 								if manifest_keys.include?(sceneKey) == false
	# 									puts "'#{sceneKey}' Not found in Product Manifest Parameters"
	# 									@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 									@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 									expect(manifest_keys).to include(sceneKey)
	# 								end
	# 							end
	# 							if @description.nil?
	# 							else
	# 								@desc = @description.join("\n")
	# 								BasePage.update_csv(@summary,@desc)
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end

	# describe "| Client: CamelBak |" do

	# 	before(:all) do
	# 		@v = Array.new
	# 		@k = Array.new
	# 	end

	# 	after(:all) do
	# 		if @v.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Product Data Connections!!"
	# 		else
	# 			puts ""
	# 			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
	# 		end
	# 		if @k.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Manifest Data!!"
	# 			puts ""
	# 		else
	# 			puts ""
	# 			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
	# 			puts ""
	# 		end
	# 	end

	# 	$cb_scene_files.each do |scene|
	# 		it "CamelBak | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
	# 			aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
	# 				manifest = AssetAPI.scene_manifest_url(scene)
	# 				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
	# 				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
	# 					@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
	# 					@description = Array.new
	# 					puts ""
	# 					puts " - #{ENV['SITE']} | #{scene} | #{product}"
	# 					product_handles = AssetAPI.product_handle_values(product)
	# 					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
	# 					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
	# 					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
	# 					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
	# 					aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
	# 						if pairs.nil?
	# 						else
	# 							pairs.each do |sceneKey, sceneValue|
	# 								if sceneValue.is_a? Array
	# 								else
	# 									if product_handles.include?(sceneValue) == false
	# 										puts "'#{sceneValue}' Not found in Product Data"
	# 										@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
	# 										@v.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(product_handles).to include(sceneValue)
	# 									end
	# 								end
	# 								if mobile_manifest_values.nil?
	# 								else
	# 									if mobile_manifest_keys.include?(sceneKey) == false
	# 										puts "'#{sceneKey}' Not found in mobileManifest Parameters"
	# 										@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(mobile_manifest_keys).to include(sceneKey)
	# 									end
	# 								end
	# 								if manifest_keys.include?(sceneKey) == false
	# 									puts "'#{sceneKey}' Not found in Product Manifest Parameters"
	# 									@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 									@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 									expect(manifest_keys).to include(sceneKey)
	# 								end
	# 							end
	# 							if @description.nil?
	# 							else
	# 								@desc = @description.join("\n")
	# 								BasePage.update_csv(@summary,@desc)
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end

	# describe "| Client: Eddie Bauer |" do

	# 	before(:all) do
	# 		@v = Array.new
	# 		@k = Array.new
	# 	end

	# 	after(:all) do
	# 		if @v.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Product Data Connections!!"
	# 		else
	# 			puts ""
	# 			puts ">>  #{@v.uniq.length} Assets with SceneFile['connections'].values not found in Product Data Connections"
	# 		end
	# 		if @k.nil?
	# 			puts ""
	# 			puts ">>  0 Discrepancies found in Manifest Data!!"
	# 			puts ""
	# 		else
	# 			puts ""
	# 			puts ">>  #{@k.uniq.length} Assets with SceneFile['connections'].keys not found in Manifest"
	# 			puts ""
	# 		end
	# 	end

	# 	$eb_scene_files.each do |scene|
	# 		it "Eddie-Bauer | #{ENV['ENVIRONMENT']} | #{scene} | Test Complete" do
	# 			aggregate_failures "Verify #{scene} Product 'connections' exist in associated productData and Manifest" do
	# 				manifest = AssetAPI.scene_manifest_url(scene)
	# 				mobile_manifest = AssetAPI.scene_mobile_manifest_url(scene)
	# 				AssetAPI.scene_productoptions_keys(scene).zip(AssetAPI.scene_connections(scene)).each do |product, pairs|
	# 					@summary = "#{ENV['SITE']} | #{scene} | #{product} | SceneFile Data Discrepancies"
	# 					@description = Array.new
	# 					puts ""
	# 					puts " - #{ENV['SITE']} | #{scene} | #{product}"
	# 					product_handles = AssetAPI.product_handle_values(product)
	# 					manifest_keys = AssetAPI.manifest_parameter_keys(product,manifest)
	# 					mobile_manifest_keys = AssetAPI.manifest_parameter_keys(product,mobile_manifest)
	# 					manifest_values = AssetAPI.manifest_parameter_values(product,manifest)
	# 					mobile_manifest_values = AssetAPI.manifest_parameter_values(product,mobile_manifest)
	# 					aggregate_failures "#{ENV['SITE']} | #{scene} | #{product}" do
	# 						if pairs.nil?
	# 						else
	# 							pairs.each do |sceneKey, sceneValue|
	# 								if sceneValue.is_a? Array
	# 								else
	# 									if product_handles.include?(sceneValue) == false
	# 										puts "'#{sceneValue}' Not found in Product Data"
	# 										@description.push("Product Data Missing Feature Handle/Value: #{sceneValue}")
	# 										@v.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(product_handles).to include(sceneValue)
	# 									end
	# 								end
	# 								if mobile_manifest_values.nil?
	# 								else
	# 									if mobile_manifest_keys.include?(sceneKey) == false
	# 										puts "'#{sceneKey}' Not found in mobileManifest Parameters"
	# 										@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 										@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 										expect(mobile_manifest_keys).to include(sceneKey)
	# 									end
	# 								end
	# 								if manifest_keys.include?(sceneKey) == false
	# 									puts "'#{sceneKey}' Not found in Product Manifest Parameters"
	# 									@description.push("Manifest Missing Parameter: '#{sceneKey}")
	# 									@k.push("#{ENV['SITE']} | #{scene} | #{product}")
	# 									expect(manifest_keys).to include(sceneKey)
	# 								end
	# 							end
	# 							if @description.nil?
	# 							else
	# 								@desc = @description.join("\n")
	# 								BasePage.update_csv(@summary,@desc)
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end
end