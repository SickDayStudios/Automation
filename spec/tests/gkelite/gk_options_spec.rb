require "./lib/pages/asset_api_page"
require "./lib/pages/gkelite/customizer_page"

describe "Fabrics & Colors" do

	before(:all) do
		@page = CustomizerPage.new
		@handles = Array.new
		options = AssetAPI.scene_productoptions_keys('gk-prs-gym')
		# options.push(AssetAPI.scene_productoptions_keys('gk-prs-cheer'))
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
			palette = Hash.new{ |hsh,key| hsh[key] = [] }
			puts "http://test.spectrumcustomizer.com/api/products/#{id}"
			case ENV['ENVIRONMENT'].to_sym
			when :test then @specs = JSON.parse(RestClient.get("http://test.spectrumcustomizer.com/api/products/#{id}"){|response, request, result| response })
			when :staging then @specs = JSON.parse(RestClient.get("http://staging.spectrumcustomizer.com/api/products/#{id}"){|response, request, result| response })
			when :prod then @specs = JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/products/#{id}"){|response, request, result| response })
			end
			@specs['contents']['rootFeature']['childFeatures'].each do |cf|
				if cf["selectionGroup"]["selections"].nil? == false
					cf["selectionGroup"]["selections"].each do |s|
						if s["features"].nil? == false
							s["features"].each do |fea|
								if fea["featureSelectionGroups"].nil? == false
									fea["featureSelectionGroups"].each do |fg|
										if (fg['thenSelectionGroup']['handle'].nil? == false && fg['thenSelectionGroup']['handle'].include?('palette'))
											fg_key = fg["thenSelectionGroup"]["handle"]
										end
										fg["thenSelectionGroup"]["selections"].each do |fgs|
											if (fgs['handle'].nil? == false && fgs['handle'].include?('color') && fgs['handle'].include?('colorcount') == false && fgs['available'] == true)
												palette[fg_key] << fgs['handle']
											end
										end
									end
								end
							end
						end
					end
				end
				cf['childFeatures'].each do |ccf|
					ccf['featureSelectionGroups'].each do |fsg|
						if (fsg['thenSelectionGroup']['handle'].nil? == false && fsg['thenSelectionGroup']['handle'].include?('palette'))
							fsg_key = fsg['thenSelectionGroup']['handle']
						end
						fsg['thenSelectionGroup']['selections'].each do |sel|
							if (sel['handle'].nil? == false && sel['handle'].include?('color') && sel['handle'].include?('colorcount') == false && sel['available'] == true)
								palette[fsg_key] << sel['handle']
							end
						end
					end
					ccf['childFeatures'].each do |cccf|
						if (cccf['selectionGroup']['handle'].nil? == false && cccf['selectionGroup']['handle'].include?('palette'))
							cf_key = cccf['selectionGroup']['handle']
						end
						cccf['selectionGroup']['selections'].each do |sels|
							if (sels['handle'].nil? == false && sels['handle'].include?('color') && sels['handle'].include?('colorcount') && sels['available'] == true)
								palette[cf_key] << sels['handle']
							end
						end
					end
				end
				palette.delete(nil)
				palette.each do |key,vals|
					if key == nil
						puts "Palette is nil for product: #{id}".red.bold
					else
						palette[key].uniq!
						if $gk_palette_colors[key].nil?
							puts "#{key}"
							puts "#{vals}"
							puts ""
						else
							if (($gk_palette_colors[key] - palette[key]).empty? == false)
								puts "#{id} | #{key} | Palette Inconsistency"
								expect($gk_palette_colors[key]).to match_array(palette[key])
							end
							expect($gk_palette_colors[key]).to match_array(palette[key])
						end
					end
				end
			end
		end
	end
end