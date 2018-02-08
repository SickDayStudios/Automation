class IconBasePage < BasePage
	include PageObject

	def self.spec_response(recipe_id)
		Nokogiri::XML.parse(RestClient.get("https://api.spectrumcustomizer.com/under-armour/icon/specification/#{recipe_id}/html"))
	end

	def self.packlist_response(recipe_id)
		Nokogiri::XML.parse(RestClient.get("http://share.madetoordercustomizer.com/under-armour/icon/packlist/#{recipe_id}/html"))
	end

	def self.parse_icon_packlist(recipe_id)
		@packlist = Array.new
		@keys = Array.new
		@values = Array.new
		@hash = Hash.new
		response = packlist_response(recipe_id)
		response.search('div[class="info"]').each do |i|
			pair = i.inner_text.join('<br>')
			pair.scan(/\S*\w.*\S/).to_a
			@hash.store(pair[0],pair[1])
		end
		return @hash
	end

	def self.parse_spec_html(recipe_id)
		details = parse_icon_spec_details("#{recipe_id}")
		images = parse_icon_spec_images("#{recipe_id}")
		colors = parse_icon_spec_colors("#{recipe_id}")
		puts ""
		puts "Details:"
		details.each do |d|
			puts "#{d}"
		end
		puts ""
		puts "Images:"
		images.each do |i|
			puts "#{i}"
		end
		puts ""
		puts "Colors:"
		colors.each do |c|
			puts "#{c}"
		end
	end

	def self.parse_icon_spec_details(recipe_id)
		@arr = Array.new
		@hash = Hash.new
		@keys = Array.new
		@values = Array.new
		@images = Array.new
		response = spec_response(recipe_id)
		row_recipe = response.search('div[class="row recipe"]')
		rows = row_recipe.search('td').each do |node|
			@arr.push(node.inner_text.scan(/\S*\w.*\S/))
		end
		array = @arr.flatten
		array.each do |string|
			if string.include?('SIZE TYPE:') == false
				if string.include?(":")
					@keys.push(string.gsub(/:/,'').downcase)
				else
					@values.push(string)
				end
			end
		end
		links = response.search('a')
		@keys.zip(@values).each do |k,v|
			if v.include?("Download All Printable Assets")
				@hash.store(k,links[2]['href'])
			elsif v.include?("Download Printable Pack List")
				@hash.store(k,links[1]['href'])
			else
				@hash.store(k, v)
			end
		end
		return @hash
	end

	def self.parse_icon_spec_images(recipe_id)
		@images = Array.new
		response = spec_response(recipe_id)
		images = response.search('img')
		images.each do |img|
			if (img['width'] == "400") == false
				@images.push(img['src'])
			end
		end
		return @images
	end

	def self.parse_icon_spec_colors(recipe_id)
		@hash = Hash.new
		@table = Array.new
		@keys = Array.new
		@values = Array.new
		response = response = spec_response(recipe_id)
		response.search('table[class="table"]').each do |e|
			element = e.text.scan(/\S*\w.*\S/)
			element.each do |s|
				@table.push(s.strip)
			end
		end
		@table.each do |string|
			if string.include?(":")
				@keys.push(string.gsub(/:/,'').downcase)
			else
				@values.push(string)
			end
		end
		@keys.zip(@values).each do |k,v|
			@hash.store(k.gsub(/\W+/,'-'), v)
		end
		return @hash
	end


	def self.parse_icon_recipeset(recipe_id)
		@rset = Hash.new
		response = JSON.parse(RestClient.get("https://api.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		response['contents']['recipes'].each do |recipes|
			recipes['recipe']['recipeData'].each do |recipeData|
				recipeData['childFeatures'].each do |childFeatures|
					if (childFeatures.empty? == false || childFeatures.nil? == false)
						if (childFeatures['featureHandle'].nil? == false && childFeatures['selectionHandle'].nil? == false)
							if (childFeatures['featureHandle'].include?("-color") == true && childFeatures['featureHandle'].include?("roughness") == false && childFeatures['featureHandle'].include?("toggle") == false && childFeatures['featureHandle'].include?("-upper-color") == false)
								@rset.store(childFeatures['featureHandle'], childFeatures['selectionHandle'])
							end
						end
						if childFeatures['selectionGroup'].nil? == false
							childFeatures['selectionGroup']['selections'].each do |selections|
								if (selections.empty? == false || selections.nil? == false)
									if (selections['childFeatures'].nil? == false || selections['childFeatures'].empty? == false)
										selections['childFeatures'].each do |features|
											if (features.empty? == false || features.nil? == false)
												if (features['featureHandle'].nil? == false && features['selectionHandle'].nil? == false)
													if (features['featureHandle'].include?("-color") || features['featureHandle'].include?("roughness") == false && features['featureHandle'].include?("toggle") == false && features['featureHandle'].include?("-upper-color") == false)
														@rset.store(features['featureHandle'], features['selectionHandle'])
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		return @rset
	end


	def self.get_text_message_handles(scene)
		@pset = Hash.new
		response = JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/productsets/#{scene}"))
		response['contents']['productGroups'].each do |productGroups|
			if productGroups.empty? == false
				productGroups['products'].each do |products|
					if products.empty? == false
						products['rootFeature']['childFeatures'].each do |childFeatures|
							if childFeatures.empty? == false
								childFeatures['selectionGroup']['selections'].each do |sg|
									if sg.empty? == false
										@pset.store(sg['handle'],sg['textMessageHandle'])
										if sg['features'].nil? == false
											sg['features'].each do |features|
												features['selectionGroup']['selections'].empty? == false
												features['selectionGroup']['selections'].each do |sel|
													@pset.store(sel['handle'],sel['textMessageHandle'])
													if sel['selectionGroup'].nil? == false
														if sel['selectionGroup']['selections'].empty? == false
															sel['selectionGroup']['selections'].each do |s|
																@pset.store(s['handle'],s['textMessageHandle'])
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		return @pset
	end


	def self.localize_text_message_handles(scene)
		@msg = get_text_message_handles(scene)
		@loc = Hash.new
		response = JSON.parse(RestClient.get("http://#{ENV['ENVIRONMENT']}.spectrumcustomizer.com/api/localized-messages/productset/#{scene}/"))
		@msg.each do |k, v|
			response['contents'].each do |contents|
				if contents['handle'] == "#{v}"
					@loc.store(k,contents['sentence'])
				end
			end
		end
		return @loc
	end

	def self.convert_handle_to_text(scene, recipe_id)
		@rset = parse_icon_recipeset(recipe_id)
		@msg = localize_text_message_handles(scene)
		@rset.each do |k,v|
			@msg.each do |key,value|
				if v == key
					@rset[k] = value
				end
			end
		end
		return @rset
	end
end