class IconBasePage < BasePage

	include PageObject

	$icon_pid = [	
		"pid3021634",
		"pid3000416",
		"pid3020924",
		"pid3000414",
		"pid3020925",
		"pid3020926",
		"pid3021635",
		"pid3021636",
		"pid3021637",
		"pid3021728",
		"pid3021729",
		"pid1326338",
		"pid3000042",
		"pid3000043",
		"pid3022239",
		"pid3022240",
		"pid3022238"
	]

	$icon_handles = [	
		'uaf-prs-railfit-mens',
		'uaf-prs-spotlight-mens',
		'uaf-prs-curry1-mens',
		'uaf-prs-clutchfit-mens',
		'uaf-prs-charged247-mens',
		'uaf-prs-highlight-mens',
		'uaf-prs-drive4-mens',
		'uaf-prs-drive4low-mens',
		'uaf-prs-curry1low-mens',
		'uaf-prs-icon-sackpack',
		'uaf-prs-ignite-mens',
		'uaf-prs-ignite-womens',
		'uaf-prs-railfit-womens',
		'uaf-prs-curry1-youth',
		'uaf-prs-clutchfit-womens',
		'uaf-prs-charged247-womens',
		'uaf-prs-drive4-womens'
	]

	$clutchfit = {
		:upper => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Dark Orange","Team Orange","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja","Upper Artwork Template", "Upper Pattern Template"],
		:logo => ["White","Black","Steel","Cardinal","Red","Tropic Pink","Team Orange","Taxi","Team Kelly Green","Forest Green","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:logo_outline => ["Charcoal","White","Black","Aluminum","Steel","Cardinal","Red","Tropic Pink","Team Orange","Taxi","Team Kelly Green","Forest Green","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:lining => ["White","Black"],
		:tongue => ["White","Black","Red","Team Orange","Taxi","Team Royal"],
		:laces => ["White","Black","Red","Team Orange","Taxi","Team Royal"],
		:plate => ["White","Black","Steel"]
	}

	$highlight = {
		:upper => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Dark Orange","Team Orange","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja","Under Armour Highlight Upper Artwork Template", "Under Armour Highlight Upper Pattern Template"],
		:tongue => ["White","Black","Steel"],
		:laces => ["White","Black","Steel","Red","Team Orange","Steeltown Gold","Forest Green","Team Royal","Midnight Navy"],
		:heel => ["White","Black","Steel","Cardinal","Red","Tropic Pink","Team Orange","Steeltown Gold","Team Kelly Green","Forest Green","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:plate => ["White","Black","Steel","Red","Team Orange","Steeltown Gold","Forest Green","Team Royal","Midnight Navy"],
		:skeleton => ["White","Black"],
		:logo => ["White","Black","Steel","Cardinal","Red","Tropic Pink","Team Orange","Steeltown Gold","Team Kelly Green","Forest Green","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:logo_outline => ["Charcoal","White","Black","Aluminum","Steel","Cardinal","Red","Tropic Pink","Team Orange","Steeltown Gold","Team Kelly Green","Forest Green","Carolina Blue","Team Royal","Midnight Navy","Purple"]
	}

	$charged = {
		:forefoot => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Dark Orange","Team Orange","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Artillery Green","Desert Sky","Carolina Blue","Blue Shift","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja","Under Armour Charged 24/7 Forefoot Pattern Template"],
		:outsole => ["White","Black","Gum Rubber"],
		:logo => ["White","Black"],
		:base => ["White"],
		:laces => ["White","Black","Aluminum","Red","Phoenix Fire","Blue Shift","Artillery Green","Midnight Navy"],
		:speckling => ["No Treatment","Black","Aluminum","Red","Phoenix Fire","Blue Shift","Artillery Green","Midnight Navy"],
		:heel => ["White","Black","Aluminum","Red","Artillery Green","Midnight Navy"],
		:strap => ["White","Black","Aluminum","Red","Artillery Green","Midnight Navy"]
	}

	$curry_mid = {
		:solid => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Cardinal","Red","Tropic Pink","Vermillion","Team Orange","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Neptune","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Baja","Upper - Artwork","Upper - Pattern"],
		:pattern => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Dark Orange","Team Orange","Phoenix Fire","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Neptune","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja"],
		:outsole => ["White","Black","Steel","Gum Rubber","Ice Blue - Translucent"],
		:laces => ["White","Black","Steel","Cardinal","Red","Phoenix Fire","Team Orange","Taxi","Neptune","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:toecap => ["White","Black","Steel","Cardinal","Red","Taxi","Carolina Blue","Team Royal","Midnight Navy"],
		:shank => ["White","Black","Metallic Gold","Metallic Silver","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"],
		:lining => ["Black","Gold","Aluminum","Steel","Cardinal","Red","Phoenix Fire","Taxi","Neptune","Carolina Blue","Team Royal","Midnight Navy"],
		:upper_logo => ["White","Black","Metallic Gold","Metallic Silver","Steel","Cardinal","Red","Phoenix Fire","Team Orange","Taxi","Neptune","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:heel => ["White","Black","Metallic Gold","Metallic Silver","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"],
		:tongue => ["White","Black","Steel","Cardinal","Red","Taxi","Forest Green","Carolina Blue","Team Royal","Midnight Navy"],
		:tongue_logo => ["White","Black","Metallic Gold","Metallic Silver","Steel","Cardinal","Red","Phoenix Fire","Team Orange","Taxi","Neptune","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:topline => ["White","Black","Metallic Gold","Metallic Silver","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"],
		:midsole => ["White","Black","Metallic Gold","Metallic Silver","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"]
	}

	$drive_low = {
		:pattern => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Dark Orange","Team Orange","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Powderkeg Blue","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja","Stone"],
		:solid => ["White","Black","Aluminum","Steel","Taxi","Red","Forest Green","UA Drive4 Upper Artwork Template"],
		:tongue => ["White","Black","Aluminum","Steel","Red","Taxi","Forest Green","Team Royal","Midnight Navy"],
		:trim => ["Black","Aluminum","Red","Team Royal","Midnight Navy"],
		:eyelets => ["White","Black","Steel","Red","Tropic Pink","Taxi","High Vis Yellow","Forest Green","Team Royal","Midnight Navy"],
		:laces => ["White","Black","Steel","Red","Tropic Pink","Taxi","High Vis Yellow","Forest Green","Team Royal","Midnight Navy"],
		:colorblock => ["No Treatment","White","Black","Metallic Silver","Metallic Gold","Steel","Red","Tropic Pink","Taxi","High Vis Yellow","Forest Green","Team Royal","Midnight Navy"],
		:logo => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Tropic Pink","Taxi","High Vis Yellow","Forest Green","Team Royal","Midnight Navy"],
		:outsole => ["White","Black","Ice Blue - Translucent","Gum","Powderkeg Blue"],
		:midsole => ["White","Black","Stone"],
		:heel => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Taxi","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"],
		:midfoot => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Tropic Pink","Taxi","High Vis Yellow","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"]
	}

	$drive_four = {
		:overlay => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Tropic Pink","Vermillion","Dark Orange","Team Orange","Texas Orange","Steeltown Gold","Tokyo Lemon","Team Kelly Green","Downtown Green","Desert Sky","Carolina Blue","St. Tropez","Powderkeg Blue","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja","Forest Green","Stone","Taxi","Under Armour Highlight Upper Pattern Template", "Under Armour Highlight Upper Artwork Template"], #,"Red",
		:tongue => ["Black","Steel","Team Royal","Midnight Navy"], #,"Red","Taxi","Forest Green","Stone",
		:heel => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Taxi","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"],
		:eyelets => ["White","Black","Aluminum","Steel","Red","Taxi","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"],
		:midfoot => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Tropic Pink","High Vis Yellow","Taxi","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"],
		:colorblock => ["No Treatment","White","Black","Metallic Silver","Metallic Gold","Steel","Red","Tropic Pink","High Vis Yellow","Taxi","Forest Green","Team Royal","Midnight Navy"],
		:trim => ["White","Black","Aluminum","Steel","Red","Taxi","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"],
		:laces => ["White","Black","Steel","Red","Tropic Pink","Taxi","High Vis Yellow","Forest Green","Team Royal","Midnight Navy"],
		:logo => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Tropic Pink","High Vis Yellow","Taxi","Forest Green","Powderkeg Blue","Team Royal","Midnight Navy"],
		:outsole => ["White","Black","Ice Blue - Translucent","Gum","Powderkeg Blue"],
		:midsole => ["White","Black","Stone"]
	}

	$curry_low = {
		:solid => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Cardinal","Red","Tropic Pink","Vermillion","Team Orange","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Neptune","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Baja","Upper - Artwork","Upper - Pattern"],
		:pattern => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Dark Orange","Team Orange","Phoenix Fire","Texas Orange","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Neptune","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Cleveland Brown","Baja"],
		:outsole => ["White","Black","Steel","Gum Rubber","Ice Blue - Translucent"],
		:toecap => ["White","Black","Steel","Cardinal","Red","Taxi","Carolina Blue","Team Royal","Midnight Navy"],
		:tongue => ["White","Black","Steel","Cardinal","Red","Taxi","Forest Green","Carolina Blue","Team Royal","Midnight Navy"],
		:tongue_logo => ["White","Black","Metallic Silver","Metallic Gold","Steel","Cardinal","Red","Phoenix Fire","Team Orange","Taxi","Neptune","Carolina Blue","Team Royal","Midnight Navy","Purple"],
		:lining => ["Black","Gold","Aluminum","Steel","Cardinal","Red","Phoenix Fire","Taxi","Neptune","Carolina Blue","Team Royal","Midnight Navy"],
		:laces => ["White","Black","Steel","Red","Team Orange","Taxi","Team Royal","Midnight Navy","Purple"],
		:topline => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"],
		:midsole => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"],
		:shank => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"],
		:heel => ["White","Black","Metallic Silver","Metallic Gold","Steel","Red","Phoenix Fire","Taxi","Neptune","Team Royal","Midnight Navy"]
	}

	$sackpack = {
		:upper => ["White","Black","Aluminum","Steel","Graphite","Taxi","Steeltown Gold","Team Orange","Red","Cardinal","Maroon","Tropic Pink","Purple","Carolina Blue","St. Tropez","Royal","Team Kelly Green","Forest Green","Texas Orange","Cleveland Brown","Dark Orange","Downtown Green","Desert Sky","Tokyo Lemon","Merit Purple","Vermillion","Jupiter Blue","Tin","Baja","Elemental","Academy","Under Armour Highlight Upper Pattern Template"],
		:logo => ["Black","White","Steel","Red","Academy","Team Royal","Taxi","Team Orange","Tropic Pink","Metallic Silver","Metallic Gold"],
		:expandable => ["White","Black","Steel","Red","Tropic Pink","Team Orange","Taxi","Team Royal","Academy"],
		:lining => ["White","Black","Steel"],
		:zipper => ["White","Black","Steel"],
		:back => ["White","Black","Steel","Red","Tropic Pink","Team Orange","Taxi","Royal","Academy"],
		:straps => ["White","Black","Steel","Red","Academy"],
		:webbing => ["White","Black","Steel"]
	}

	$mens_ignite = {
		:pattern => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Team Orange","Texas Orange","Dark Orange","Cleveland Brown","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Baja"],
		:solid => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Team Orange","Texas Orange","Dark Orange","Cleveland Brown","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Baja","UA Ignite Footbed Artwork Template"],
		:strap => ["White","Black","Steel","Cardinal","Red","Team Orange","Steeltown Gold","Forest Green","Team Royal","Midnight Navy"],
		:strap_logo => ["White","Black","Metallic Silver","Steel","Cardinal","Red","Team Orange","Steeltown Gold","Metallic Gold","Forest Green","Team Royal","Midnight Navy"],
		:lining => ["White","Black","Steel","Cardinal","Red","Team Orange","Steeltown Gold","Forest Green","Team Royal","Midnight Navy"],
		:outsole => ["White","Black"]
	}

	$womens_ignite = {
		:pattern => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Team Orange","Texas Orange","Dark Orange","Cleveland Brown","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Baja"],
		:solid => ["White","Black","Elemental","Aluminum","Steel","Tin","Graphite","Maroon","Cardinal","Red","Tropic Pink","Vermillion","Team Orange","Texas Orange","Dark Orange","Cleveland Brown","Steeltown Gold","Taxi","Tokyo Lemon","Team Kelly Green","Downtown Green","Forest Green","Desert Sky","Carolina Blue","St. Tropez","Jupiter Blue","Team Royal","Midnight Navy","Purple","Merit Purple","Baja","UA Ignite Footbed Artwork Template"],
		:strap => ["White","Black","Aluminum","Tropic Pink","Desert Sky","Carolina Blue","Jupiter Blue","Purple"],
		:strap_logo => ["White","Black","Aluminum","Metallic Silver","Tropic Pink","Metallic Gold","Desert Sky","Carolina Blue","Jupiter Blue","Purple"],
		:lining => ["White","Black","Aluminum","Tropic Pink","Desert Sky","Carolina Blue","Jupiter Blue","Purple"],
		:outsole => ["White","Black"]
	}

	$railfit = {
		:upper => ["Black/Elemental","Forest Green/Forest Green","Cardinal/Cardinal","Midnight Navy/Midnight Navy","Black/Black","White/Elemental","White/White","Elemental/Elemental"],#,"Cardinal/White","Forest Green/White","Midnight Navy/White"
		:collar => ["White","Black","Elemental","Midnight Navy","Gold","Cardinal","Forest Green"],#,"Red"
		:tongue => ["White","Black","Elemental","Midnight Navy","Gold","Cardinal","Forest Green"],#,"Red","Tokyo Lemon","Team Royal"
		:laces => ["White","Black","Elemental","Midnight Navy","Gold","Cardinal","Forest Green"],#,"Red","Tokyo Lemon","Team Royal"
		:guide => ["White","Black","Elemental","Midnight Navy","Gold","Cardinal","Forest Green"],#,"Red","Tokyo Lemon","Team Royal"
		:panel => ["White","Black","Aluminum","Steel","Graphite","Taxi","Steeltown Gold","Team Orange","Cardinal","Maroon","Tropic Pink","Purple","Carolina Blue","St. Tropez","Team Royal","Midnight Navy","Team Kelly Green","Forest Green","Texas Orange","Cleveland Brown","Dark Orange","Downtown Green","Desert Sky","Merit Purple","Vermillion","Jupiter Blue","Tin","Baja","Elemental","Railfit Side Panel Artwork Template"],#,"Tokyo Lemon","Red"
		:rails => ["White","Black","Elemental","Midnight Navy","Gold","Cardinal","Forest Green"],#,"Red","Tokyo Lemon","Team Royal"
		:midsole => ["White","Black"],
		:heel => ["White","Black","Elemental","Midnight Navy","Gold","Cardinal","Forest Green"], #,"Red","Tokyo Lemon","Team Royal"
		:outsole => ["White","Black","Gum Rubber"],
		:sockliner => ["White","Black"]
	}

	$spotlight = {
		:pattern => ["White","Black","Aluminum","Steel","Graphite","Taxi","Steeltown Gold","Team Orange","Red","Cardinal","Maroon","Tropic Pink","Purple","Carolina Blue","St. Tropez","Team Royal","Midnight Navy","Team Kelly Green","Forest Green","Texas Orange","Cleveland Brown","Dark Orange","Downtown Green","Desert Sky","Tokyo Lemon","Merit Purple","Vermillion","Jupiter Blue","Tin","Baja","Elemental"],
		:solid => ["White","Black","Aluminum","Steel","Graphite","Taxi","Steeltown Gold","Team Orange","Red","Cardinal","Maroon","Tropic Pink","Purple","Carolina Blue","St. Tropez","Team Royal","Midnight Navy","Team Kelly Green","Forest Green","Texas Orange","Cleveland Brown","Dark Orange","Downtown Green","Desert Sky","Tokyo Lemon","Merit Purple","Vermillion","Jupiter Blue","Tin","Baja","Elemental","Spotlight Upper Artwork Template"],
		:knit => ["White","Black"],
		:laces => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Cardinal"],
		:eyelets => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Cardinal"],
		:toe_logo => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Cardinal"],
		:toe_logo_outline => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Charcoal","Aluminum","Cardinal"],
		:heel => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Cardinal"],
		:weld => ["Chrome"],
		:medial => ["Metallic Silver"],
		:heel_logo_outline => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Cardinal"],
		:plate => ["Gold Chrome","Silver Chrome","Iridescent"],#"Gunmetal Chrome",
		:trim => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Cardinal"],
		:medial_outline => ["Black","Midnight Navy","Red","White","Forest Green","Team Orange","Steeltown Gold","Steel","Team Royal","Charcoal"]
	}


	# tiff endpoint
	# http://api.spectrumcustomizer.com/api/external/under-armour/icon/webtoprint/download/recipeSet/M4JUBTG9
	# http://test.spectrumcustomizer.com/api/external/under-armour/icon/webtoprint/download/recipeSet/
	# http://test.spectrumcustomizer.com/api/external/under-armour/icon/webtoprint/download/recipeSet/


	def self.spec_response(recipe_id)
		case ENV['ENVIRONMENT'].to_sym
		when :test then @response = Nokogiri::XML.parse(RestClient.get("test.spectrumcustomizer.com/under-armour/icon/specification/#{recipe_id}/html"))
		when :staging then @response = Nokogiri::XML.parse(RestClient.get("staging.spectrumcustomizer.com/under-armour/icon/specification/#{recipe_id}/html"))
		when :prod then @response = Nokogiri::XML.parse(RestClient.get("api.spectrumcustomizer.com/under-armour/icon/specification/#{recipe_id}/html"))
		end
		return @response
	end

	def self.packlist_response(recipe_id)
		case ENV['ENVIRONMENT'].to_sym
		when :test then @response = Nokogiri::XML.parse(RestClient.get("test.spectrumcustomizer.com/under-armour/icon/packlist/#{recipe_id}/html"))
		when :staging then @response = Nokogiri::XML.parse(RestClient.get("staging.spectrumcustomizer.com/under-armour/icon/packlist/#{recipe_id}/html"))
		when :prod then @response = Nokogiri::XML.parse(RestClient.get("api.spectrumcustomizer.com/under-armour/icon/packlist/#{recipe_id}/html"))
		end
		return @response
	end

	def self.parse_icon_packlist(recipe_id)
		@packlist = Array.new
		@keys = Array.new
		@values = Array.new
		@hash = Hash.new{ |hsh,key| hsh[key] = [] }
		@response = packlist_response(recipe_id)
		@response.search('div[class="info"]').each do |i|
			body = i.inner_text.gsub('<br>',"")
			pair = body.scan(/\S.*/)
			@hash.store(pair[0],pair[1].strip)
		end
		return @hash
	end

	def self.parse_spec_html(recipe_id)
		details = parse_icon_spec_details(recipe_id)
		images = parse_icon_spec_images(recipe_id)
		colors = parse_icon_spec_colors(recipe_id)
		return details,images,colors
	end

	def self.parse_icon_spec_details(recipe_id)
		@arr = Array.new
		@hash = Hash.new{ |hsh,key| hsh[key] = [] }
		@keys = Array.new
		@values = Array.new
		@images = Array.new
		@response = spec_response(recipe_id)
		row_recipe = @response.search('div[class="row recipe"]')
		rows = row_recipe.search('td').each do |node|
			@arr.push(node.inner_text.scan(/\S.*/))
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
		links = @response.search('a')
		@keys.zip(@values).each do |k,v|
			if v == "Download All Printable Assets"
				@hash.store(k,links[2]['href'])
			elsif v == "Download Printable Pack List"
				@hash.store(k,links[1]['href'])
			else
				@hash.store(k, v)
			end
		end
		return @hash
	end

	def self.parse_icon_spec_images(recipe_id)
		@images = Array.new
		@response = spec_response(recipe_id)
		images = @response.search('img')
		images.each do |img|
			if (img['width'] == "400") == false
				@images.push(img['src'])
			end
		end
		return @images
	end

	def self.parse_icon_spec_colors(recipe_id)
		@hash = Hash.new{ |hsh,key| hsh[key] = [] }
		@table = Array.new
		@keys = Array.new
		@values = Array.new
		@response = spec_response(recipe_id)
		@response.search('table[class="table"]').each do |e|
			element = e.text.scan(/\S*\w.*\S/)
			element.each do |s|
				s.gsub("-"," ")
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
			@hash.store(k.gsub(/\W+/,' '), v)
		end
		return @hash
	end

	def self.get_product_set_handle(recipe_id)
		case ENV['ENVIRONMENT'].to_sym
		when :test then @response = JSON.parse(RestClient.get("test.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		when :staging then @response = JSON.parse(RestClient.get("staging.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		when :prod then @response = JSON.parse(RestClient.get("api.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		end
		return @response['contents']['productSetHandle']
	end


	def self.parse_icon_recipeset(recipe_id)
		@rset = Hash.new{ |hsh,key| hsh[key] = [] }
		case ENV['ENVIRONMENT'].to_sym
		when :test then @response = JSON.parse(RestClient.get("test.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		when :staging then @response = JSON.parse(RestClient.get("staging.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		when :prod then @response = JSON.parse(RestClient.get("api.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		end
		@response['contents']['recipes'].each do |recipes|
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
		@pset = Hash.new{ |hsh,key| hsh[key] = [] }
		case ENV['ENVIRONMENT'].to_sym
		when :test then @response = JSON.parse(RestClient.get("test.spectrumcustomizer.com/api/productsets/#{scene}"))
		when :staging then @response = JSON.parse(RestClient.get("staging.spectrumcustomizer.com/api/productsets/#{scene}"))
		when :prod then @response = JSON.parse(RestClient.get("api.spectrumcustomizer.com/api/productsets/#{scene}"))
		end
		@response['contents']['productGroups'].each do |productGroups|
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
		@msg = parse_product_set(scene)
		@loc = Hash.new{ |hsh,key| hsh[key] = [] }
		case ENV['ENVIRONMENT'].to_sym
		when :test
			@response = JSON.parse(RestClient.get("test.spectrumcustomizer.com/api/localized-messages/productset/#{scene}/"))
		when :staging
			@response = JSON.parse(RestClient.get("staging.spectrumcustomizer.com/api/localized-messages/productset/#{scene}/"))
		when :prod
			@response = JSON.parse(RestClient.get("api.spectrumcustomizer.com/api/localized-messages/productset/#{scene}/"))
		end
		@msg.each do |k, v|
			v.each do |value|
				@response['contents'].each do |c|
					if c['handle'] == "#{value}"
						@loc[k] << c['fragment']
					end
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
					@rset[k] = "#{value.gsub(/ \D\d+./,"")}"
				end
			end
		end
		return @rset
	end








	def self.parse_product_set(scene)
		@pset = Hash.new{ |hsh,key| hsh[key] = [] }
		case ENV['ENVIRONMENT'].to_sym
		when :test
			@response = JSON.parse(RestClient.get("test.spectrumcustomizer.com/api/productsets/#{scene}"))
		when :staging
			@response = JSON.parse(RestClient.get("staging.spectrumcustomizer.com/api/productsets/#{scene}"))
		when :prod
			@response = JSON.parse(RestClient.get("api.spectrumcustomizer.com/api/productsets/#{scene}"))
		end

		@response['contents']['productGroups'][0]['products'].each do |p|

			if p['rootFeature']['childFeatures'].nil? == false
				p['rootFeature']['childFeatures'].each do |cf|

					if cf['handle'].include?("size") || cf['handle'].include?("metalness") || cf['handle'].include?("artwork")
					else

						handle = cf['handle']

						if cf['selectionGroup']['selections'].nil? == false
							cf['selectionGroup']['selections'].each do |s|

								@pset[handle] << s['textMessageHandle']

								if s['features'].nil? == false
									s['features'].each do |f|

										if f['handle'].include?("size") || f['handle'].include?("metalness") || f['handle'].include?("artwork")
										else

											if f['childFeatures'].nil? == false
												f['childFeatures'].each do |ccf|

													handle = ccf['handle']

													ccf['selectionGroup']['selections'].each do |ssg|

														@pset[handle] << ssg['textMessageHandle']

													end
												end
											end

											if f['handle'].nil? == false && f['selectionGroup']['selections'].nil? == false
												
												handle = f['handle']

												f['selectionGroup']['selections'].each do |ss|

													@pset[handle] << ss['textMessageHandle']

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
end