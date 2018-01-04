require "./lib/pages/asset_api_page"

describe "Manifest Shader['model'] & Shader['source'] FileType Validator" do

	before(:each) do
		@s = Array.new
		@m = Array.new
	end

	after(:each) do
		if @s.nil?
			puts ""
			puts ">>  Shaders are up to date"
		else
			puts ""
			puts ">>  #{@s.uniq.length} Assets Found using incorrect Shader"
		end
		if @m.nil?
			puts ""
			puts ">>  Models are up to date"
			puts ""
		else
			puts ""
			puts ">>  #{@m.uniq.length} Assets Found using .obj Model"
			puts ""
		end
	end

	context "Benchmade" do
		$bm_scene_files.each do |scene|
			it "Benchmade | #{scene}" do
				aggregate_failures "Verify Correct Model FileType & ShaderLib" do
					manifest = AssetAPI.scene_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).each do |product|
						shader = AssetAPI.manifest_shader_source(product,manifest)
						file_type = AssetAPI.manifest_model(product,manifest)
						aggregate_failures " - #{product}: Incorrect Manifest Model FileType & ShaderLib" do
							if file_type.is_a?(Array)
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									file_type.each do |fileType|
										if fileType.include?(".drc") == false
											@m.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect FileType: #{fileType}"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect("#{product} | #{fileType}").to include(".drc")
										end
									end
								end
							else
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									if fileType.include?(".drc") == false
										@m.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect FileType: #{fileType}"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect("#{product} | #{fileType}").to include(".drc")
									end
								end
							end
							if shader.is_a?(Array)
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									shader.each do |source|
										shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
										if $approved_shaders.include?(shader_value) == false
											@s.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect Shader: '#{shader_value}'"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect($approved_shaders).to include(shader_value)
										end
									end
								end
							else
								shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									if $approved_shaders.include?(shader_value) == false
										@s.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect Shader: '#{shader_value}'"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect($approved_shaders).to include(shader_value)
									end
								end
							end
						end
					end
				end
			end
		end
	end

	context "Eddie-Bauer" do
		$eb_scene_files.each do |scene|
			it "Eddie-Bauer | #{scene}" do
				aggregate_failures "Verify Correct Model FileType & ShaderLib" do
					manifest = AssetAPI.scene_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).each do |product|
						shader = AssetAPI.manifest_shader_source(product,manifest)
						file_type = AssetAPI.manifest_model(product,manifest)
						aggregate_failures " - #{product}: Incorrect Manifest Model FileType & ShaderLib" do
							if file_type.is_a?(Array)
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									file_type.each do |fileType|
										if fileType.include?(".drc") == false
											@m.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect FileType: #{fileType}"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect("#{product} | #{fileType}").to include(".drc")
										end
									end
								end
							else
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									if fileType.include?(".drc") == false
										@m.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect FileType: #{fileType}"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect("#{product} | #{fileType}").to include(".drc")
									end
								end
							end
							if shader.is_a?(Array)
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									shader.each do |source|
										shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
										if $approved_shaders.include?(shader_value) == false
											@s.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect Shader: '#{shader_value}'"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect($approved_shaders).to include(shader_value)
										end
									end
								end
							else
								shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									if $approved_shaders.include?(shader_value) == false
										@s.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect Shader: '#{shader_value}'"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect($approved_shaders).to include(shader_value)
									end
								end
							end
						end
					end
				end
			end
		end
	end

	context "CamelBak" do
		$cb_scene_files.each do |scene|
			it "CamelBak | #{scene}" do
				aggregate_failures "Verify Correct Model FileType & ShaderLib" do
					manifest = AssetAPI.scene_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).each do |product|
						shader = AssetAPI.manifest_shader_source(product,manifest)
						file_type = AssetAPI.manifest_model(product,manifest)
						aggregate_failures " - #{product}: Incorrect Manifest Model FileType & ShaderLib" do
							if file_type.is_a?(Array)
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									file_type.each do |fileType|
										if fileType.include?(".drc") == false
											@m.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect FileType: #{fileType}"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect("#{product} | #{fileType}").to include(".drc")
										end
									end
								end
							else
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									if fileType.include?(".drc") == false
										@m.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect FileType: #{fileType}"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect("#{product} | #{fileType}").to include(".drc")
									end
								end
							end
							if shader.is_a?(Array)
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									shader.each do |source|
										shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
										if $approved_shaders.include?(shader_value) == false
											@s.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect Shader: '#{shader_value}'"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect($approved_shaders).to include(shader_value)
										end
									end
								end
							else
								shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									if $approved_shaders.include?(shader_value) == false
										@s.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect Shader: '#{shader_value}'"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect($approved_shaders).to include(shader_value)
									end
								end
							end
						end
					end
				end
			end
		end
	end

	context "UA Icon" do
		$uaf_scene_files.each do |scene|
			it "UA Icon | #{scene}" do
				aggregate_failures "Verify Correct Model FileType & ShaderLib" do
					manifest = AssetAPI.scene_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).each do |product|
						shader = AssetAPI.manifest_shader_source(product,manifest)
						file_type = AssetAPI.manifest_model(product,manifest)
						aggregate_failures " - #{product}: Incorrect Manifest Model FileType & ShaderLib" do
							if file_type.is_a?(Array)
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									file_type.each do |fileType|
										if fileType.include?(".drc") == false
											@m.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect FileType: #{fileType}"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect("#{product} | #{fileType}").to include(".drc")
										end
									end
								end
							else
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									if fileType.include?(".drc") == false
										@m.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect FileType: #{fileType}"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect("#{product} | #{fileType}").to include(".drc")
									end
								end
							end
							if shader.is_a?(Array)
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									shader.each do |source|
										shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
										if $approved_shaders.include?(shader_value) == false
											@s.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect Shader: '#{shader_value}'"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect($approved_shaders).to include(shader_value)
										end
									end
								end
							else
								shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									if $approved_shaders.include?(shader_value) == false
										@s.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect Shader: '#{shader_value}'"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect($approved_shaders).to include(shader_value)
									end
								end
							end
						end
					end
				end
			end
		end
	end


	context "GK-Elite" do
		$gk_scene_files.each do |scene|
			it "GK-Elite | #{scene}" do
				aggregate_failures "Verify Correct Model FileType & ShaderLib" do
					manifest = AssetAPI.scene_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).each do |product|
						shader = AssetAPI.manifest_shader_source(product,manifest)
						file_type = AssetAPI.manifest_model(product,manifest)
						aggregate_failures " - #{product}: Incorrect Manifest Model FileType & ShaderLib" do
							if file_type.is_a?(Array)
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									file_type.each do |fileType|
										if fileType.include?(".drc") == false
											@m.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect FileType: #{fileType}"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect("#{product} | #{fileType}").to include(".drc")
										end
									end
								end
							else
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									if fileType.include?(".drc") == false
										@m.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect FileType: #{fileType}"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect("#{product} | #{fileType}").to include(".drc")
									end
								end
							end
							if shader.is_a?(Array)
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									shader.each do |source|
										shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
										if $approved_shaders.include?(shader_value) == false
											@s.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect Shader: '#{shader_value}'"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect($approved_shaders).to include(shader_value)
										end
									end
								end
							else
								shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									if $approved_shaders.include?(shader_value) == false
										@s.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect Shader: '#{shader_value}'"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect($approved_shaders).to include(shader_value)
									end
								end
							end
						end
					end
				end
			end
		end
	end


	context "Under-Armour" do
		$uau_scene_files.each do |scene|
			it "Under-Armour | #{scene}" do
				aggregate_failures "Verify Correct Model FileType & ShaderLib" do
					manifest = AssetAPI.scene_manifest_url(scene)
					AssetAPI.scene_productoptions_keys(scene).each do |product|
						shader = AssetAPI.manifest_shader_source(product,manifest)
						file_type = AssetAPI.manifest_model(product,manifest)
						aggregate_failures " - #{product}: Incorrect Manifest Model FileType & ShaderLib" do
							if file_type.is_a?(Array)
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									file_type.each do |fileType|
										if fileType.include?(".drc") == false
											@m.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect FileType: #{fileType}"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect("#{product} | #{fileType}").to include(".drc")
										end
									end
								end
							else
								aggregate_failures " - #{product}: Manifest Models should not be '.obj' format" do
									if fileType.include?(".drc") == false
										@m.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect FileType: #{fileType}"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect("#{product} | #{fileType}").to include(".drc")
									end
								end
							end
							if shader.is_a?(Array)
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									shader.each do |source|
										shader_value = source.scan(/\/([a-zA-Z0-9]+)\./).last.first
										if $approved_shaders.include?(shader_value) == false
											@s.push(product)
											puts ""
											puts " - #{scene} | #{product}"
											puts "Incorrect Shader: '#{shader_value}'"
											puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
											# expect($approved_shaders).to include(shader_value)
										end
									end
								end
							else
								shader_value = shader.scan(/\/([a-zA-Z0-9]+)\./).first.last
								aggregate_failures " - #{product}: Should use correct ShaderLib" do
									if $approved_shaders.include?(shader_value) == false
										@s.push(product)
										puts ""
										puts " - #{scene} | #{product}"
										puts "Incorrect Shader: '#{shader_value}'"
										puts "Found at: #{ENV['SITE']} | #{scene} | #{product}"
										# expect($approved_shaders).to include(shader_value)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end