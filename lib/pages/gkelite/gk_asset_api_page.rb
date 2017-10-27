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
		@arr.each do |group|
			list = (@specs["productGroups"]["#{group}"]["productOptions"].keys)
			list.each do |key|
				puts @specs["productGroups"]["#{group}"]["productOptions"]["#{key}"]["connections"].keys
				puts ""
			end
		end
		@connections
	end
end