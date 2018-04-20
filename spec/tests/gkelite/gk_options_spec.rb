require "./lib/pages/asset_api_page"
require "./lib/pages/gkelite/customizer_page"

describe "Fabrics & Colors" do

	before(:all) do
		@page = CustomizerPage.new
		@palette = Hash.new{ |hsh,key| hsh[key] = [] }
		@handles = Array.new
		options = AssetAPI.scene_productoptions_keys('gk-prs-gym')
		options.flatten
		options.each do |opts|
			@handles.push(opts)
		end
		@handles.uniq!
		@handles.reject! { |r| r.include?("extra" || "mannequin" || "scene.json" || "dummy") }
		@handles.flatten!
	end

	it "Verify Color/Fabric Options" do
		@handles.each do |id|
			@specs = JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/products/#{id}"){|response, request, result| response })
			@specs['contents']['rootFeature']['childFeatures'].each do |cf|
				cf['childFeatures'].each do |ccf|
					ccf['featureSelectionGroups'].each do |fsg|
						if fsg['thenSelectionGroup']['handle'].nil? == false && fsg['thenSelectionGroup']['handle'].include?('palette') && fsg['thenSelectionGroup']['handle'].include?('cheer') == false
							fsg_key = fsg['thenSelectionGroup']['handle']
						end
						fsg['thenSelectionGroup']['selections'].each do |sel|
							if sel['handle'].nil? == false && sel['handle'].include?('color') && sel['handle'].include?('colorcount') == false
								@palette[fsg_key] << sel['handle']
							end
						end
					end
					ccf['childFeatures'].each do |cccf|
						if cccf['selectionGroup']['handle'].nil? == false && cccf['selectionGroup']['handle'].include?('palette') && cccf['selectionGroup']['handle'].include?('cheer') == false
							cf_key = cccf['selectionGroup']['handle']
						end
						cccf['selectionGroup']['selections'].each do |sels|
							if sels['handle'].nil? == false && sels['handle'].include?('color') && sels['handle'].include?('colorcount') 
								@palette[cf_key] << sels['handle']
							end
						end
					end
				end
				@palette.each do |key,vals|
					if key == nil
						puts "Palette is nil for product: #{id}".bold.red.underline
					else
						@palette.delete(nil)
						@palette[key].uniq!
						expect($gk_palette_colors[key]).to match_array(@palette[key])
					end
				end
			end
		end
	end
end