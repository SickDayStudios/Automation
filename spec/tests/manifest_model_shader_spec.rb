require "./lib/pages/asset_api_page"

describe "Manifest Shader['model']Shader['source'] Validator" do

	before(:each) do
		@s = Array.new
		@m = Array.new
	end


	ENV['SITE'] = 'eddie-bauer'
	$eb_scene_files.each do |scene|
		it "Manifest:RegionMap['model']" do
			aggregate_failures "Verify Correct Model FileType" do
				AssetAPI.scene_productoptions_keys(scene).each do |product|
					file_type = AssetAPI.manifest_model(product)
					aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
						if file_type.is_a?(Array)
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								file_type.each do |fileType|
									if fileType.include?(".drc") == false
										puts " - '.obj' Model Found: "
										puts "#{ENV['SITE']} : #{scene} : #{product}"
										puts "#{fileType}"
										@m.push(fileType)
									end
									expect("#{product}::#{fileType}").to include(".drc")
								end
							end
						else
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								if file_type.include?(".drc") == false
									puts " - '.obj' Model Found: "
									puts "#{ENV['SITE']} : #{scene} : #{product}"
									puts "#{file_type}"
									@m.push(file_type)
								end
								expect("#{product}::#{file_type}").to include(".drc")
							end
						end
					end
				end
			end
		end

		# it "Manifest:RegionMap['source']" do
		# 	aggregate_failures "Verify Correct ShaderLib" do
		# 		AssetAPI.scene_productoptions_keys(scene).each do |product|
		# 			shader = AssetAPI.manifest_shader_source(product)
		# 			aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 				if shader.is_a?(Array)
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						shader.each do |source|
		# 							shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
		# 							if $approved_shaders.include?(shader_value) == false
		# 								@s.push(product)
		# 								puts "Incorrect Shader: '#{shader_value}'"
		# 								puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 							end
		# 							expect($approved_shaders).to include(shader_value)
		# 						end
		# 					end
		# 				else
		# 					shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						if $approved_shaders.include?(shader_value) == false
		# 							@s.push(product)
		# 							puts "Incorrect Shader: '#{shader_value}'"
		# 							puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 						end
		# 						expect($approved_shaders).to include(shader_value)
		# 					end
		# 				end
		# 			end
		# 		end
		# 	end
		# 	source = @s.uniq
		# 	puts ""
		# 	puts "#{source.length} Assets Found in SceneFile '#{scene}' with outdated Shader"
		# 	puts source
		# end
	end

	ENV['SITE'] = 'camelbak'
	$cb_scene_files.each do |scene|
		it "Manifest:RegionMap['model']" do
			aggregate_failures "Verify Correct Model FileType" do
				AssetAPI.scene_productoptions_keys(scene).each do |product|
					puts " - #{scene}::#{product}"
					file_type = AssetAPI.manifest_model(product)
					aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
						if file_type.is_a?(Array)
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								file_type.each do |fileType|
									expect("#{product}::#{fileType}").to include(".drc")
								end
							end
						else
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								expect("#{product}::#{fileType}").to include(".drc")
							end
						end
					end
				end
			end
		end

		# it "Manifest:RegionMap['source']" do
		# 	aggregate_failures "Verify Correct ShaderLib" do
		# 		AssetAPI.scene_productoptions_keys(scene).each do |product|
		# 			shader = AssetAPI.manifest_shader_source(product)
		# 			aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 				if shader.is_a?(Array)
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						shader.each do |source|
		# 							shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
		# 							if $approved_shaders.include?(shader_value) == false
		# 								@s.push(product)
		# 								puts "Incorrect Shader: '#{shader_value}'"
		# 								puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 							end
		# 							expect($approved_shaders).to include(shader_value)
		# 						end
		# 					end
		# 				else
		# 					shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						if $approved_shaders.include?(shader_value) == false
		# 							@s.push(product)
		# 							puts "Incorrect Shader: '#{shader_value}'"
		# 							puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 						end
		# 						expect($approved_shaders).to include(shader_value)
		# 					end
		# 				end
		# 			end
		# 		end
		# 	end
		# 	source = @s.uniq
		# 	puts ""
		# 	puts "#{source.length} Assets Found in SceneFile '#{scene}' with outdated Shader"
		# 	puts source
		# end
	end

	ENV['SITE'] = 'ua-icon'
	$uaf_scene_files.each do |scene|
		it "Manifest:RegionMap['model']" do
			aggregate_failures "Verify Correct Model FileType" do
				AssetAPI.scene_productoptions_keys(scene).each do |product|
					puts " - #{scene}::#{product}"
					file_type = AssetAPI.manifest_model(product)
					aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
						if file_type.is_a?(Array)
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								file_type.each do |fileType|
									expect("#{product}::#{fileType}").to include(".drc")
								end
							end
						else
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								expect("#{product}::#{fileType}").to include(".drc")
							end
						end
					end
				end
			end
		end

		# it "Manifest:RegionMap['source']" do
		# 	aggregate_failures "Verify Correct ShaderLib" do
		# 		AssetAPI.scene_productoptions_keys(scene).each do |product|
		# 			shader = AssetAPI.manifest_shader_source(product)
		# 			aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 				if shader.is_a?(Array)
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						shader.each do |source|
		# 							shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
		# 							if $approved_shaders.include?(shader_value) == false
		# 								@s.push(product)
		# 								puts "Incorrect Shader: '#{shader_value}'"
		# 								puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 							end
		# 							expect($approved_shaders).to include(shader_value)
		# 						end
		# 					end
		# 				else
		# 					shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						if $approved_shaders.include?(shader_value) == false
		# 							@s.push(product)
		# 							puts "Incorrect Shader: '#{shader_value}'"
		# 							puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 						end
		# 						expect($approved_shaders).to include(shader_value)
		# 					end
		# 				end
		# 			end
		# 		end
		# 	end
		# 	source = @s.uniq
		# 	puts ""
		# 	puts "#{source.length} Assets Found in SceneFile '#{scene}' with outdated Shader"
		# 	puts source
		# end
	end

	ENV['SITE'] = 'gk-elite'
	$gk_scene_files.each do |scene|
		it "Manifest:RegionMap['model']" do
			aggregate_failures "Verify Correct Model FileType" do
				AssetAPI.scene_productoptions_keys(scene).each do |product|
					puts " - #{scene}::#{product}"
					file_type = AssetAPI.manifest_model(product)
					aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
						if file_type.is_a?(Array)
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								file_type.each do |fileType|
									expect("#{product}::#{fileType}").to include(".drc")
								end
							end
						else
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								expect("#{product}::#{fileType}").to include(".drc")
							end
						end
					end
				end
			end
		end

		# it "Manifest:RegionMap['source']" do
		# 	aggregate_failures "Verify Correct ShaderLib" do
		# 		AssetAPI.scene_productoptions_keys(scene).each do |product|
		# 			shader = AssetAPI.manifest_shader_source(product)
		# 			aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 				if shader.is_a?(Array)
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						shader.each do |source|
		# 							shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
		# 							if $approved_shaders.include?(shader_value) == false
		# 								@s.push(product)
		# 								puts "Incorrect Shader: '#{shader_value}'"
		# 								puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 							end
		# 							expect($approved_shaders).to include(shader_value)
		# 						end
		# 					end
		# 				else
		# 					shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						if $approved_shaders.include?(shader_value) == false
		# 							@s.push(product)
		# 							puts "Incorrect Shader: '#{shader_value}'"
		# 							puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 						end
		# 						expect($approved_shaders).to include(shader_value)
		# 					end
		# 				end
		# 			end
		# 		end
		# 	end
		# 	source = @s.uniq
		# 	puts ""
		# 	puts "#{source.length} Assets Found in SceneFile '#{scene}' with outdated Shader"
		# 	puts source
		# end
	end

	ENV['SITE'] = 'under-armour'
	$uau_scene_files.each do |scene|
		it "Manifest:RegionMap['model']" do
			aggregate_failures "Verify Correct Model FileType" do
				AssetAPI.scene_productoptions_keys(scene).each do |product|
					puts " - #{scene}::#{product}"
					file_type = AssetAPI.manifest_model(product)
					aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
						if file_type.is_a?(Array)
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								file_type.each do |fileType|
									expect("#{product}::#{fileType}").to include(".drc")
								end
							end
						else
							aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
								expect("#{product}::#{fileType}").to include(".drc")
							end
						end
					end
				end
			end
		end

		# it "Manifest:RegionMap['source']" do
		# 	aggregate_failures "Verify Correct ShaderLib" do
		# 		AssetAPI.scene_productoptions_keys(scene).each do |product|
		# 			shader = AssetAPI.manifest_shader_source(product)
		# 			aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 				if shader.is_a?(Array)
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						shader.each do |source|
		# 							shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
		# 							if $approved_shaders.include?(shader_value) == false
		# 								@s.push(product)
		# 								puts "Incorrect Shader: '#{shader_value}'"
		# 								puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 							end
		# 							expect($approved_shaders).to include(shader_value)
		# 						end
		# 					end
		# 				else
		# 					shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
		# 					aggregate_failures " - #{product}: Should use correct ShaderLib" do
		# 						if $approved_shaders.include?(shader_value) == false
		# 							@s.push(product)
		# 							puts "Incorrect Shader: '#{shader_value}'"
		# 							puts "Found at: #{ENV['SITE']}>>#{scene}>>#{product}"
		# 						end
		# 						expect($approved_shaders).to include(shader_value)
		# 					end
		# 				end
		# 			end
		# 		end
		# 	end
		# 	source = @s.uniq
		# 	puts ""
		# 	puts "#{source.length} Assets Found in SceneFile '#{scene}' with outdated Shader"
		# 	puts source
		# end
	end
end