class GKAssetAPI < BasePage

	# gets product groups to interpolate into path
	def scene_productgroups_keys
		url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/gk-elite/scenelib/gk-elite/ua-prs-gym/scene.json"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		@arr = Array.new
		list = @specs["productGroups"].keys
		list.each do |key|
			@arr.push(key)
		end
		@arr
	end


	# =>  grab all product handles (eg. gk-fea-6018-smoke)
	def scene_productoptions_keys
		@options = Array.new
		self.scene_productgroups_keys.each do |group|
			list = @specs["productGroups"]["#{group}"]["productOptions"].keys
			list.each do |key|
				if key.include? "extra"
				else
					@options.push(key)
				end
			end
		end
		@options
	end

	# grabs all scene file keys in the 'connections' array
	def scene_connection_keys
		@connections = Array.new
		self.scene_productgroups_keys.each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				@connections.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].keys)
			end
		end
		@connections
	end

	# grabs all scene file values in the 'connections' array
	def scene_connection_values
		@values = Array.new
		self.scene_productgroups_keys.each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				@values.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].values)
			end
		end
		@values
	end


	# grabs all values from the product data
	def product_handle_values(product)
		array = Array.new
		url = "http://#{ENV['ENVIRONMENT']}.spectrumcustomizer.com/api/products/#{product}"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		array = @specs["contents"]["rootFeature"]
		file = File.open("./lib/helpers/recursive_feature_traversal.js", "r")
		features = file.read
		result = self.execute_script(features, @specs["contents"]["rootFeature"])
	end

	# grabs all the keys from the manifest parameters array
	def manifest_parameter_keys(product)
		url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/gk-elite/#{product}/config/product.manifest"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		manifest = @specs["parameters"].keys
	end
end