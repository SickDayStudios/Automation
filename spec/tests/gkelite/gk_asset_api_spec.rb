require "./lib/pages/gkelite/gk_asset_api_page"

describe "Backend Call: " do

	before(:all) do
		@page = GKAssetAPI.new
	end
	
	context "API: " do

		it "Verified SceneFile Values exist in Product Data" do
			@page.scene_productoptions_keys.zip(@page.scene_connection_values).each do |product, values|
				puts " - Compare Values: #{product}"
				# puts "product: #{@page.product_handle_values(product)}"
				# puts "scene: #{values}"
				expect(@page.product_handle_values(product)).to include(*values)
			end
		end

		it "Verified SceneFile Keys exist in Product Manifest" do
			@page.scene_productoptions_keys.zip(@page.scene_connection_keys).each do |product, keys|
				puts " - Compare Keys: #{product}"
				# puts "manifest: #{@page.manifest_parameter_keys(product)}"
				# puts "scene: #{keys}"
				expect(@page.manifest_parameter_keys(product)).to include(*keys)
			end
		end

		# it "Scene" do
		# 	@page.scene_connection_values.each do |x|
		# 		puts x
		# 		puts ""
		# 	end
		# 	@page.scene_connection_keys.each do |x|
		# 		puts x
		# 		puts ""
		# 	end
		# end
	end
end