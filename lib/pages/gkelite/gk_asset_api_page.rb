class GKAssetAPI < BasePage

	def scene_productgroups_keys
		url = 'http://madetoordertest.blob.core.windows.net/webgl/client/gk-elite/scenelib/gk-elite/ua-prs-gym/scene.json'
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


	def scene_productoptions_keys
		@options = Array.new
		@arr.each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				@options.push(key)
			end
		end
		@options
	end


	def scene_connection_keys
		@connections = Array.new
		self.scene_productgroups_keys.each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				map = @specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].keys
				map.each do |c|
					@connections.push(c)
				end
			end
		end
		@connections
	end

	def scene_connection_values
		@values = Array.new
		self.scene_productgroups_keys.each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				map = @specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].values
				map.each do |c|
					@values.push(c)
				end
			end
		end
		@values
	end


	def product_urls
		@products = Array.new
		self.scene_productoptions_keys.each do |key|
			@products.push("http://#{ENV['ENVIRONMENT']}.madetoorder.pollinate.com/api/products/#{key}")
		end
	end

	def iterate(specs)
		specs.each do |key, value|
			if (value.is_a?(Hash) || value.is_a?(Array))
				value.values.each do |v|
					puts v
				end
			end
		end
	end

	def product_handle_keys
		url = 'http://test.madetoorder.pollinate.com/api/products/gk-pro-6508-quest'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		self.iterate(@specs)
	end


	def manifest_urls
		@manifests = Array.new
		self.scene_productoptions_keys.each do |key|
			@manifests.push("http://madetoorder#{ENV['ENVIRONMENT']}.blob.core.windows.net/webgl/client/gk-elite/#{key}/config/product.manifest")
		end
	end


	def manifest_parameter_keys
		url = 'http://madetoordertest.blob.core.windows.net/webgl/client/gk-elite/gk-pro-6508-quest/config/product.manifest'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@specs = JSON.parse(response)
		@specs["parameters"].keys
	end
end