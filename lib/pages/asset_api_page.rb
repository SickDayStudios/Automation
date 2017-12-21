class AssetAPI < BasePage

	def self.get_product_handles
		@links = Array.new
		@handles = Array.new
		$scene_files.each do |scene|
			@handles.push(AssetAPI.scene_productoptions_keys(scene))
			@handles.uniq
			@handles.reject { |r| r.include?("extra") }
		end
		@handles.flatten
	end


	# =>  gets SceneFile product groups to interpolate into path (eg. Tops, Bottoms, Socks, etc.)
	def self.scene_productgroups_keys(scene)
		if $gk_scene_files.include? "#{scene}"
			ENV['SITE'] = 'gk-elite'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
		end
		if $uau_scene_files.include? "#{scene}"
			ENV['SITE'] = 'under-armour'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
		end
		if $uaf_scene_files.include? "#{scene}"
			ENV['SITE'] = 'ua-icon'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
		end
		if $cb_scene_files.include? "#{scene}"
			ENV['SITE'] = 'camelbak'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
		end
		if $eb_scene_files.include? "#{scene}"
			ENV['SITE'] = 'eddie-bauer'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
		end
		if $bm_scene_files.include? "#{scene}"
			ENV['SITE'] = 'benchmade'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/#{scene}/scene.json"
		end
		if $sr_scene_files.include? "#{scene}"
			ENV['SITE'] = 'shed-rain'
			url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/scenelib/#{ENV['SITE']}/scene.json"
		end
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		@arr = Array.new
		list = @specs["productGroups"].keys
		list.each do |key|
			if key == "mannequin"
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
				if (key.include?("extra"))
				else
					@options.push(key)
				end
			end
		end
		@options
	end

	# =>  grabs all scenefile keys in the 'connections' hash
	def self.scene_connection_keys(scene)
		@connections = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("extra"))
				else
					@connections.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].keys)
				end
			end
		end
		@connections
	end

	# =>  grabs all scenefile values in the 'connections' hash
	def self.scene_connection_values(scene)
		@values = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("extra"))
				else
					@values.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].values)
				end
			end
		end
		@values
	end

	# => grabs all scenefile key:value pairs in the 'connections' hash
	def self.scene_connections(scene)
		@pairs = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				if (key.include?("extra"))
				else
					@pairs.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"])
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
				@manifest.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["manifest"])
			end
		end
		@manifest.uniq.first
	end

	def self.scene_mobile_manifest_url(scene)
		@manifest = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				@manifest.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["mobileManifest"])
			end
		end
		@manifest.uniq.first
	end

	# =>  grabs all featureHandle values from the Product Data
	def self.product_handle_values(product)
		array = Array.new
		url = "http://#{ENV['ENVIRONMENT']}.spectrumcustomizer.com/api/products/#{product}"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		file = File.open("./lib/helpers/recursive_feature_traversal.js", "r")
		features = file.read
		result = $driver.execute_script(features, @specs["contents"]["rootFeature"])
		result.reject { |r| r.empty? }
	end

	# =>  grabs all the keys from the manifest parameters array
	def self.manifest_parameter_keys(product, manifest)
		if product.nil?
		elsif manifest.nil?
		else
			url = ("http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest)
			uri = URI(url)
			response = Net::HTTP.get(uri)
			@specs = JSON.parse(response)
			result = @specs["parameters"].keys
		end
	end

	# =>  grabs all the keys from the manifest parameters array
	def self.manifest_parameter_values(product, manifest)
		if product.nil?
		elsif manifest.nil?
		else
			url = ("http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest)
			uri = URI(url)
			response = Net::HTTP.get(uri)
			@specs = JSON.parse(response)
			result = @specs["parameters"].values
		end
	end

	def self.manifest_model(product, manifest)
		if product.nil?
			puts "Missing Product Data"
		elsif manifest.nil?
			puts "Missing Manifest"
		else
			url = ("http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest)
			uri = URI(url)
			response = Net::HTTP.get(uri)
			@specs = JSON.parse(response)
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
			url = ("http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/#{ENV['SITE']}/#{product}/" + manifest)
			uri = URI(url)
			response = Net::HTTP.get(uri)
			@specs = JSON.parse(response)
			@shaders = Array.new
			regionmaps = @specs["shaders"].keys
			regionmaps.each do |regionMap|
				@shaders.push(@specs["shaders"]["#{regionMap}"]["source"])
			end
			@shaders
		end
	end

	$sr_scene_files = ['shed-rain']

	$bm_scene_files = ['bmk-prs-knives']

	$approved_shaders = ['regionmap','artbox','standard','pshadow']

	$gk_scene_files = ['gk-prs-bottoms','gk-prs-cheer','gk-prs-gym','ua-prs-cheer','ua-prs-gym','ua-prs-warmups']

	$uau_scene_files = ['uau-prs-football','uau-prs-baseball','uau-prs-basketball','uau-prs-hockey','uau-prs-lacrosse','uau-prs-volleyball','uau-prs-track','uau-prs-soccer','uau-prs-softball','uau-prs-training','uau-prs-wrestling','uau-prs-football-brawler','uau-prs-sideline']

	$uaf_scene_files = ['uaf-prs-curry1-mens','uaf-prs-curry1-youth','uaf-prs-curry25-mens','uaf-prs-icon-sackpack','uaf-prs-drive4low-mens','uaf-prs-charged247-mens','uaf-prs-charged247-womens','uaf-prs-curry1low-mens','uaf-prs-drive4-mens','uaf-prs-drive4-womens','uaf-prs-clutchfit-mens','uaf-prs-clutchfit-womens','uaf-prs-curry25-mens','uaf-prs-highlight-mens']

	$cb_scene_files = ['cb-pro-chute1-bottle','cb-pro-chute20-rubberized','cb-pro-chute20-stainless-vacuum-bottle','cb-pro-chute20-vacuum-bottle','cb-pro-chute40-stainless-vacuum-bottle','cb-pro-chute40-vacuum-bottle','cb-pro-chute75-bottle','cb-pro-eddy1-bottle','cb-pro-eddy4-kids-bottle','cb-pro-eddy6-bottle','cb-pro-eddy6-insulated-bottle','cb-pro-eddy20-rubberized','cb-pro-eddy20-vacuum-bottle','cb-pro-eddy75-bottle','cb-pro-forge12-bottle','cb-pro-forge16-bottle','cb-pro-kickbak20-bottle','cb-pro-kickbak20-stainless-bottle','cb-pro-kickbak30-bottle','cb-pro-kickbak30-stainless-bottle','cb-pro-podium-bigchill-bottle','cb-pro-podium-chill-bottle','cb-pro-podium21-bottle','cb-pro-podium24-bottle']

	$eb_scene_files = ['eb-pro-mens-microtherm-hood','eb-pro-mens-microtherm-nohood','eb-pro-mens-sandstone-hood','eb-pro-mens-sandstone-nohood','eb-pro-womens-microtherm-hood','eb-pro-womens-microtherm-nohood','eb-pro-womens-sandstone-hood','eb-pro-womens-sandstone-nohood']

	$scene_files = ['bmk-prs-knives','gk-prs-bottoms','gk-prs-cheer','gk-prs-gym','ua-prs-cheer','ua-prs-gym','ua-prs-warmups','uau-prs-hockey','uau-prs-lacrosse','uau-prs-volleyball','uau-prs-track','uau-prs-soccer','uau-prs-softball','uau-prs-training','uau-prs-wrestling','uau-prs-baseball','uau-prs-football','uau-prs-basketball','uau-prs-football-brawler','uau-prs-sideline','uaf-prs-curry1-mens','uaf-prs-curry1-youth','uaf-prs-curry25-mens','uaf-prs-icon-sackpack','uaf-prs-drive4low-mens','uaf-prs-charged247-mens','uaf-prs-charged247-womens','uaf-prs-curry1low-mens','uaf-prs-drive4-mens','uaf-prs-drive4-womens','uaf-prs-clutchfit-mens','uaf-prs-clutchfit-womens','uaf-prs-curry25-mens','uaf-prs-highlight-mens','cb-pro-chute1-bottle','cb-pro-chute20-rubberized','cb-pro-chute20-stainless-vacuum-bottle','cb-pro-chute20-vacuum-bottle','cb-pro-chute40-stainless-vacuum-bottle','cb-pro-chute40-vacuum-bottle','cb-pro-chute75-bottle','cb-pro-eddy1-bottle','cb-pro-eddy4-kids-bottle','cb-pro-eddy6-bottle','cb-pro-eddy6-insulated-bottle','cb-pro-eddy20-rubberized','cb-pro-eddy20-vacuum-bottle','cb-pro-eddy75-bottle','cb-pro-forge12-bottle','cb-pro-forge16-bottle','cb-pro-kickbak20-bottle','cb-pro-kickbak20-stainless-bottle','cb-pro-kickbak30-bottle','cb-pro-kickbak30-stainless-bottle','cb-pro-podium-bigchill-bottle','cb-pro-podium-chill-bottle','cb-pro-podium21-bottle','cb-pro-podium24-bottle','eb-pro-mens-microtherm-hood','eb-pro-mens-microtherm-nohood','eb-pro-mens-sandstone-hood','eb-pro-mens-sandstone-nohood','eb-pro-womens-microtherm-hood','eb-pro-womens-microtherm-nohood','eb-pro-womens-sandstone-hood','eb-pro-womens-sandstone-nohood']
end