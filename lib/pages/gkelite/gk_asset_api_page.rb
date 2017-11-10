class GKAssetAPI < BasePage

	$gk_scene_files = [
						'gk-prs-bottoms',
						'gk-prs-cheer',
						'gk-prs-gym',
						'ua-prs-cheer',
						'ua-prs-gym',
						'ua-prs-warmups']

	# gets product groups to interpolate into path
	def self.scene_productgroups_keys(scene)
		url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/gk-elite/scenelib/gk-elite/#{scene}/scene.json"
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
	def self.scene_productoptions_keys(scene)
		@options = Array.new
		scene_productgroups_keys(scene).each do |group|
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
	def self.scene_connection_keys(scene)
		@connections = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				@connections.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].keys)
			end
		end
		@connections
	end

	# grabs all scene file values in the 'connections' array
	def self.scene_connection_values(scene)
		@values = Array.new
		scene_productgroups_keys(scene).each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				@values.push(@specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].values)
			end
		end
		@values
	end


	# grabs all values from the product data
	def self.product_handle_values(product)
		array = Array.new
		url = "http://#{ENV['ENVIRONMENT']}.spectrumcustomizer.com/api/products/#{product}"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		array = @specs["contents"]["rootFeature"]
		file = File.open("./lib/helpers/recursive_feature_traversal.js", "r")
		features = file.read
		result = $driver.execute_script(features, @specs["contents"]["rootFeature"])
	end

	# grabs all the keys from the manifest parameters array
	def self.manifest_parameter_keys(product)
		url = "http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/gk-elite/#{product}/config/product.manifest"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		manifest = @specs["parameters"].keys
	end
end