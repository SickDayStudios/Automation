class AssetAPI < BasePage

	def self.get_product_handles
		@links = Array.new
		@handles = Array.new
		$scene_files.each do |scene|
			options = AssetAPI.scene_productoptions_keys(scene)
			@handles.push(options.flatten)
			@handles.uniq
			@handles.reject { |r| r.include?("extra") || r.include?("mannequin") || r.include?("scene.json") || r.include?("dummy") || r.include?("test") }
		end
		@handles.flatten
	end


	# =>  gets SceneFile product groups to interpolate into path (eg. Tops, Bottoms, Socks, etc.)
	def self.scene_productgroups_keys(scene)
		if $gk_scene_files.include? "#{scene}"
			ENV['SITE'] = 'gk-elite'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			end
		end
		if $uau_scene_files.include? "#{scene}"
			ENV['SITE'] = 'under-armour'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			end
		end
		if $uaf_scene_files.include? "#{scene}"
			ENV['SITE'] = 'ua-icon'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			end
		end
		if $cb_scene_files.include? "#{scene}"
			ENV['SITE'] = 'camelbak'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			end
		end
		if $eb_scene_files.include? "#{scene}"
			ENV['SITE'] = 'eddie-bauer'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			end
		end
		if $bm_scene_files.include? "#{scene}"
			ENV['SITE'] = 'benchmade'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
			end
		end
		if $sr_scene_files.include? "#{scene}"
			ENV['SITE'] = 'shed-rain'
			case ENV['ENVIRONMENT'].to_sym
			when :test then url = "http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/scene.json"
			when :staging then url = "http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/scene.json"
			when :prod then url = "http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/scene.json"
			end
		end
		@specs = JSON.parse(RestClient.get(url){|response, request, result| response })
		@arr = Array.new
		list = @specs["productGroups"].keys
		list.each do |key|
			if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == "")
			else
				@arr.push(key)
			end
		end
		@arr
	end


	# =>  grab all Product Handles from SceneFile (eg. gk-fea-6018-smoke)
	def self.scene_productoptions_keys(scene)
		@options = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = @specs["productGroups"]["#{group}"]["productOptions"].keys
			list.each do |key|
				if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == "")
				else	
					@options.push(key)
				end
			end
		end
		@options.reject { |r| r.include?("raster") || r == "" }
	end

	# =>  grabs all scenefile keys in the 'connections' hash
	def self.scene_connection_keys(scene)
		@connections = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == "" || key.include?("raster") )
				else
					@connections.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].keys)
				end
			end
		end
		@connections.reject { |r| r.include?("raster") || r == "" }
	end

	# =>  grabs all scenefile values in the 'connections' hash
	def self.scene_connection_values(scene)
		@values = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == '' || key.kind_of?(Array) || key.include?("raster"))
				elsif @specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].values == ""
				else
					@values.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].values)
				end
			end
		end
		@values.reject { |r| r.include?("raster") || r == "" }
	end

	# => grabs all scenefile key:value pairs in the 'connections' hash
	def self.scene_connections(scene)
		@pairs = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == "")
				else
					if (@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"] == nil) || (@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"] == "")
					else
						@pairs.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"])
					end
				end
			end
		end
		@pairs
	end

	# => grabs scenefile manifest url suffix to append to manifest base URL
	def self.scene_manifest_url(scene)
		@manifest = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == "")
				else
					@manifest.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["manifest"])
				end
			end
		end
		@manifest.uniq.first
	end

	def self.scene_mobile_manifest_url(scene)
		@manifest = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("mannequin") || key.include?("extra") || key.include?("scene.json") || key.include?("dummy") || key.nil? || key.empty? || key == "")
				else
				@manifest.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["mobileManifest"])
			end
			end
		end
		@manifest.uniq.first
	end

	# =>  grabs all featureHandle values from the Product Data
	def self.product_handle_values(product)
		array = Array.new
		case ENV['ENVIRONMENT'].to_sym
		when :test then @specs = JSON.parse(RestClient.get("http://test.spectrumcustomizer.com/api/products/#{product}"){|response, request, result| response })
		when :staging then @specs = JSON.parse(RestClient.get("http://staging.spectrumcustomizer.com/api/products/#{product}"){|response, request, result| response })
		when :prod then @specs = JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/products/#{product}"){|response, request, result| response })
		end
		file = File.open("./lib/helpers/recursive_feature_traversal.js", "r")
		features = file.read
		if $driver.execute_script(features, @specs["contents"]["rootFeature"]).nil?
			puts "#{product} | Missing Product Data"
		else
			result = $driver.execute_script(features, @specs["contents"]["rootFeature"])
			result.reject { |r| r.empty? }
		end
	end

	# =>  grabs all the keys from the manifest parameters array
	def self.manifest_parameter_keys(product, manifest)
		if product.nil?
		elsif manifest.nil?
		else
			case ENV['ENVIRONMENT'].to_sym
			when :test then @specs = JSON.parse(RestClient.get("http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :staging then @specs = JSON.parse(RestClient.get("http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :prod then @specs = JSON.parse(RestClient.get("http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			end
			result = @specs["parameters"].keys
		end
	end

	# =>  grabs all the keys from the manifest parameters array
	def self.manifest_parameter_values(product, manifest)
		if product.nil?
		elsif manifest.nil?
		else
			case ENV['ENVIRONMENT'].to_sym
			when :test then @specs = JSON.parse(RestClient.get("http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :staging then @specs = JSON.parse(RestClient.get("http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :prod then @specs = JSON.parse(RestClient.get("http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			end
			result = @specs["parameters"].values
		end
	end

	def self.manifest_model(product, manifest)
		if product.nil?
			puts "Missing Product Data"
		elsif manifest.nil?
			puts "Missing Manifest"
		else
			case ENV['ENVIRONMENT'].to_sym
			when :test then @specs = JSON.parse(RestClient.get("http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :staging then @specs = JSON.parse(RestClient.get("http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :prod then @specs = JSON.parse(RestClient.get("http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			end
			@models = Array.new
			regionmaps = @specs["shaders"].keys
			regionmaps.each do |regionMap|
				model_values = @specs["shaders"]["#{regionMap}"]["models"].values
				model_values.each do |model|
					@models.push(model)
				end
			end
			@models
		end
	end

	def self.manifest_shader_source(product, manifest)
		if product.nil?
			puts "Missing Product Data"
		elsif manifest.nil?
			puts "Missing Manifest"
		else
			case ENV['ENVIRONMENT'].to_sym
			when :test then @specs = JSON.parse(RestClient.get("http://madetoordertest.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :staging then @specs = JSON.parse(RestClient.get("http://madetoorderstaging.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			when :prod then @specs = JSON.parse(RestClient.get("http://madetoorder.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest){|response, request, result| response })
			end
			@shaders = Array.new
			regionmaps = @specs["shaders"].keys
			regionmaps.each do |regionMap|
				@shaders.push(@specs["shaders"]["#{regionMap}"]["source"])
			end
			@shaders
		end
	end

	def self.product_data_selection_values(product)
		@values = Array.new
		@data = JSON.parse(RestClient.get("http://test.spectrumcustomizer.com/api/products/#{product}"){|response, request, result| response })
		@manifest = JSON.parse(RestClient.get("http://madetoordertest.blob.core.windows.net/webgl/client/gk-elite/#{product}/config/product.manifest"){|response, request, result| response })
		# if (@manifest['shaders']['instances']['models'].keys) == nil
		# 	puts "#{product} >>> Check Manifest Structure"
		# else
			@data['contents']['rootFeature']['childFeatures'].each do |cf|
				cf['childFeatures'].each do |ccf|
					ccf['selectionGroup']['selections'].each do |sgs|
						@values.push(sgs['value'])
					end
					ccf['childFeatures'].each do |cccf|
						cccf['selectionGroup']['selections'].each do |sgsels|
							@values.push(sgsels['value'])
						end
					end
					ccf['featureSelectionGroups'].each do |fsg|
						fsg['thenSelectionGroup']['selections'].each do |tsgs|
							@values.push(tsgs['value'])
						end
					end
				end
			end
			@values.reject! { |r| r.include?("#") || r.empty? || r.nil? || r == "1" || r == 'inktek' || r == "tricot" || r == "forward" || r == "reverse" || r == "2" || r == "3" || r == "blue" || r == "blues" || r == "reds" || r == "black white" || r == "greens" || r == "orange" || r == "patriotic" || r == "pink" || r == "purple" || r.include?('-') || r.include?('nylpf') || r.include?('mesh') || r.include?('hologram') || r.include?('velvet') || r.include?('embroidery') || r.include?('crystals') || r.include?('drytech') || r.include?('holotek') || r.include?('subfuse') || r.include?('sublimated') || r.include?('polytek')}
			@models.reject! { |r| r.include?('jewel') || r.include?('sequin') || r.include?('spangle')  }
			return [@models.sort,@values.sort]
		# end
	end




	$sr_scene_files = ['shed-rain']

	$bm_scene_files = ['bmk-prs-knives']

	$approved_shaders = ['regionmap','artbox','standard','pshadow','translucent']

	$gk_scene_files = [
		'gk-prs-bottoms',
		'gk-prs-cheer',
		'gk-prs-warmups',
		'gk-prs-gym'
		# 'ua-prs-cheer',
		# 'ua-prs-gym',
		# 'ua-prs-warmups'
	]

	$uau_scene_files = [
		'uau-prs-volleyball',
		'uau-prs-track',
		'uau-prs-soccer',
		'uau-prs-football',
		# 'uau-prs-baseball',
		# 'uau-prs-basketball',
		# 'uau-prs-hockey',
		# 'uau-prs-lacrosse',
		# 'uau-prs-softball',
		'uau-prs-training',
		# 'uau-prs-wrestling',
		# 'uau-prs-football-brawler',
		'uau-prs-sideline'
	]

	$uaf_scene_files = [	
		'uaf-prs-railfit-mens',
		'uaf-prs-spotlight-mens',
		'uaf-prs-curry1-mens',
		'uaf-prs-clutchfit-mens',
		'uaf-prs-charged247-mens',
		'uaf-prs-highlight-mens',
		'uaf-prs-drive4-mens',
		'uaf-prs-drive4low-mens',
		'uaf-prs-curry1low-mens',
		'uaf-prs-icon-sackpack',
		'uaf-prs-ignite-mens',
		'uaf-prs-ignite-womens',
		'uaf-prs-railfit-womens',
		'uaf-prs-curry1-youth',
		'uaf-prs-clutchfit-womens',
		'uaf-prs-charged247-womens',
		'uaf-prs-drive4-womens',
		'uaf-prs-curry5-kids',
		'uaf-prs-curry5-mens',
		'uaf-prs-hovrhavoclow-mens',
		'uaf-prs-hovrhavoc-mens',
		'uaf-prs-hovrhavoc-womens'
	]

	$cb_scene_files = [
		'cb-pro-chute1-bottle',
		'cb-pro-chute20-rubberized',
		'cb-pro-chute20-stainless-vacuum-bottle',
		'cb-pro-chute20-vacuum-bottle',
		'cb-pro-chute40-stainless-vacuum-bottle',
		'cb-pro-chute40-vacuum-bottle',
		'cb-pro-chute75-bottle',
		'cb-pro-eddy1-bottle',
		'cb-pro-eddy4-kids-bottle',
		'cb-pro-eddy6-bottle',
		'cb-pro-eddy6-insulated-bottle',
		'cb-pro-eddy20-rubberized',
		'cb-pro-eddy20-vacuum-bottle',
		'cb-pro-eddy75-bottle',
		'cb-pro-forge12-bottle',
		'cb-pro-forge16-bottle',
		'cb-pro-kickbak20-bottle',
		'cb-pro-kickbak20-stainless-bottle',
		'cb-pro-kickbak30-bottle',
		'cb-pro-kickbak30-stainless-bottle',
		'cb-pro-podium-bigchill-bottle',
		'cb-pro-podium-chill-bottle',
		'cb-pro-podium21-bottle',
		'cb-pro-podium24-bottle'
	]

	$eb_scene_files = [
		'eb-pro-mens-microtherm-hood',
		'eb-pro-mens-microtherm-nohood',
		'eb-pro-mens-sandstone-hood',
		'eb-pro-mens-sandstone-nohood',
		'eb-pro-womens-microtherm-hood',
		'eb-pro-womens-microtherm-nohood',
		'eb-pro-womens-sandstone-hood',
		'eb-pro-womens-sandstone-nohood'
	]

	$scene_files = [
		'bmk-prs-knives',
		'gk-prs-bottoms',
		'gk-prs-cheer',
		'gk-prs-gym',
		'gk-prs-warmups',
		# 'ua-prs-cheer',
		# 'ua-prs-gym',
		# 'ua-prs-warmups',
		# 'uau-prs-hockey',
		# 'uau-prs-lacrosse',
		'uau-prs-volleyball',
		'uau-prs-track',
		'uau-prs-soccer',
		# 'uau-prs-softball',
		'uau-prs-training',
		# 'uau-prs-wrestling',
		# 'uau-prs-baseball',
		'uau-prs-football',
		'uau-prs-basketball',
		# 'uau-prs-football-brawler',
		'uau-prs-sideline',
		'uaf-prs-railfit-mens',
		'uaf-prs-spotlight-mens',
		'uaf-prs-curry1-mens',
		'uaf-prs-clutchfit-mens',
		'uaf-prs-charged247-mens',
		'uaf-prs-highlight-mens',
		'uaf-prs-drive4-mens',
		'uaf-prs-drive4low-mens',
		'uaf-prs-curry1low-mens',
		'uaf-prs-icon-sackpack',
		'uaf-prs-ignite-mens',
		'uaf-prs-ignite-womens',
		'uaf-prs-railfit-womens',
		'uaf-prs-curry1-youth',
		'uaf-prs-clutchfit-womens',
		'uaf-prs-charged247-womens',
		'uaf-prs-drive4-womens',
		'uaf-prs-curry5-kids',
		'uaf-prs-curry5-mens',
		'cb-pro-chute1-bottle',
		'cb-pro-chute20-rubberized',
		'cb-pro-chute20-stainless-vacuum-bottle',
		'cb-pro-chute20-vacuum-bottle',
		'cb-pro-chute40-stainless-vacuum-bottle',
		'cb-pro-chute40-vacuum-bottle',
		'cb-pro-chute75-bottle',
		'cb-pro-eddy1-bottle',
		'cb-pro-eddy4-kids-bottle',
		'cb-pro-eddy6-bottle',
		'cb-pro-eddy6-insulated-bottle',
		'cb-pro-eddy20-rubberized',
		'cb-pro-eddy20-vacuum-bottle',
		'cb-pro-eddy75-bottle',
		'cb-pro-forge12-bottle',
		'cb-pro-forge16-bottle',
		'cb-pro-kickbak20-bottle',
		'cb-pro-kickbak20-stainless-bottle',
		'cb-pro-kickbak30-bottle',
		'cb-pro-kickbak30-stainless-bottle',
		'cb-pro-podium-bigchill-bottle',
		'cb-pro-podium-chill-bottle',
		'cb-pro-podium21-bottle',
		'cb-pro-podium24-bottle',
		'eb-pro-mens-microtherm-hood',
		'eb-pro-mens-microtherm-nohood',
		'eb-pro-mens-sandstone-hood',
		'eb-pro-mens-sandstone-nohood',
		'eb-pro-womens-microtherm-hood',
		'eb-pro-womens-microtherm-nohood',
		'eb-pro-womens-sandstone-hood',
		'eb-pro-womens-sandstone-nohood']
end