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

	def scene_connection_keys(groups, options)
		@arr.each do |gr|
			@options.each do |op|
				puts @specs["productGroups"]["#{gr}"]["productOptions"]["#{op}"]["connections"].keys
			end
		end
	end

	def print_keys
		self.scene_connection_keys(self.scene_productgroups_keys, self.scene_productoptions_keys)
	end
end