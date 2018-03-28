class BMKBasePage < BasePage
	include PageObject

	divs(:catagory_groups, class: "desktopmenu-section__categorygroup__category")
	divs(:feature_groups, class: "desktopmenu-section__featuregroup__feature")
	divs(:steel_option, class: "c-fea-blade-steel__selection__image")
	divs(:color_option, class: "c-fea-color__swatch")
	buttons(:material_option, class: "c-fea-material-texture__selection__image")
	buttons(:clip_option, class: "c-fea-clip__swatch__toggle")
	div(:saved_recipe_id, class: "")
	span(:button_status, text: "Buying...")
	ul(:shape_option, class: "c-fea-blade-shape__selections")
	div(:ui_price, class: ["c-customizer__panel__product-largescreencontrols__content__price"])
	button(:buy, class: ["c-buy-share__cta--buy"])
	button(:add_to_cart, text: "Add to cart")
	div(:vue, id: "benchmade-customizer-vue")
	span(:mini_price, css: "#cart-sidebar > li > div > table > tbody > tr:nth-child(1) > td > span")
	span(:unit_price, css: "#shopping-cart-table > tbody > tr.first.odd > td.product-cart-price > span > span")
	link(:checkout, class: ["button checkout-button"])
	div(:mini_cart, class: ["minicart-wrapper"])
	links(:delete, text: "Delete")
	checkbox(:checkbox, id: "termsAccepted")




	$recipes = []
	$knives = ["bmk-pro-crookedriver-full","bmk-pro-grip-full","bmk-pro-barrage-full","bmk-pro-grip-mini","bmk-pro-barrage-mini"]



	def self.bmk_saved_spec(id)
		case ENV['ENVIRONMENT'].to_sym
			when :prod then Nokogiri::XML.parse(RestClient.get("http://api.spectrumcustomizer.com/benchmade/specification/saved/#{id}"){|response, request, result| response })
			when :staging then Nokogiri::XML.parse(RestClient.get("http://staging.spectrumcustomizer.com/benchmade/specification/saved/#{id}"){|response, request, result| response })
			when :test then Nokogiri::XML.parse(RestClient.get("http://test.spectrumcustomizer.com/benchmade/specification/saved/#{id}"){|response, request, result| response })
		end
	end

	def self.bmk_price(id)
		case ENV['ENVIRONMENT'].to_sym
			when :test then JSON.parse(RestClient.get("http://test.spectrumcustomizer.com/benchmade/specification/saved/#{id}"){|response, request, result| response })
			when :staging then JSON.parse(RestClient.get("http://staging.spectrumcustomizer.com/api/recipesets/pricing/#{id}"){|response, request, result| response })
			when :prod then JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/recipesets/pricing/#{id}"){|response, request, result| response })
		end
	end

	def check_cart_price
		asset = $knives.sample
		case ENV['ENVIRONMENT'].to_sym
		when :test then $driver.goto("http://madetoordertest.blob.core.windows.net/benchmade/frontend/index.html#/product/#{asset}")
		when :staging
			case asset
			when "bmk-pro-crookedriver-full" then
				$driver.goto("https://staging.benchmade.com/crooked-river-family.html?customize=1#/product/bmk-pro-crookedriver-full")
			when "bmk-pro-grip-full" || "bmk-pro-grip-mini" then
				$driver.goto("https://staging.benchmade.com/griptilian-family.html?customize=1#/product/#{asset}")
			when "bmk-pro-barrage-full" || "bmk-pro-barrage-mini" then
				$driver.goto("https://staging.benchmade.com/barrage-family.html?customize=1#/product/#{asset}")
			end
		when :prod then 
			case asset
			when "bmk-pro-crookedriver-full" then
				$driver.goto("https://www.benchmade.com/crooked-river-family.html?customize=1#/product/bmk-pro-crookedriver-full")
			when "bmk-pro-grip-full" || "bmk-pro-grip-mini" then
				$driver.goto("https://www.benchmade.com/griptilian-family.html?customize=1#/product/#{asset}")
			when "bmk-pro-barrage-full" || "bmk-pro-barrage-mini" then
				$driver.goto("https://www.benchmade.com/barrage-family.html?customize=1#/product/#{asset}")
			end
		end
		self.wait_until(60) { self.ui_price_element.present? }
		sleep 2
		self.catagory_groups_elements.each do |cg|			
			if cg.button.attribute('title').include?('Lasermark') == false			
				if cg.attribute('class').include?('active') == false				
					cg.button.click			
				end				
				self.feature_groups_elements.each do |fg|
					if fg.attribute('class').include?('active') == false						
						fg.button.click			
					end										
					case
					when fg.button.text.include?("SHAPE")
						shapes = self.shape_option_element.lis
						shape = shapes[rand(shapes.length)]
						shape.button.click
					when fg.button.text.include?("STEEL")
						steel = self.steel_option_elements
						steel.sample.button.click		
					when fg.button.text.include?("MATERIAL")
						material = self.material_option_elements
						material.sample.click
					when fg.button.text.include?("CLIP")
						clip = self.clip_option_elements
						clip.sample.click
					when fg.button.text.include?("STEEL") == false && fg.button.text.include?("MATERIAL") == false && fg.button.text.include?("CLIP") == false
						color = self.color_option_elements
						color.sample.button.click
					end
				end
			end
		end
		self.buy
		self.check_checkbox
		self.add_to_cart
		knife_price = self.ui_price
		sleep 2
		self.wait_until { self.mini_cart_element.present? }
		mini_cart_price = self.mini_price
		self.checkout_element.click
		self.wait_until { self.url.include?('cart') }
		sleep 2
		cart_price = self.unit_price
		delete_elements.length.times do
			delete_elements[0].click
		end
		return knife_price, mini_cart_price, cart_price
	end

	def random_knife
		asset = $knives.sample
		case ENV['ENVIRONMENT'].to_sym
		when :test then
			$driver.goto("http://madetoordertest.blob.core.windows.net/benchmade/frontend/index.html#/product/#{asset}")
			$driver.goto("http://madetoordertest.blob.core.windows.net/benchmade/frontend/index.html#/product/#{asset}")
		when :staging then 
			$driver.goto("http://madetoorderstaging.azureedge.net/benchmade/frontend/index.html#/product/#{asset}")
			$driver.goto("http://madetoorderstaging.azureedge.net/benchmade/frontend/index.html#/product/#{asset}")
		when :prod then 
			$driver.goto("http://madetoorder.azureedge.net/benchmade/frontend/index.html#/product/#{asset}")
			$driver.goto("http://madetoorder.azureedge.net/benchmade/frontend/index.html#/product/#{asset}")
		end
		self.wait_while(timeout: 60, message: "Page Failed to Load after 60 seconds") { self.ui_price == "" }
		sleep 2
		self.catagory_groups_elements.each do |cg|			
			if cg.button.attribute('title').include?('Lasermark') == false			
				if cg.attribute('class').include?('active') == false				
					cg.button.click			
				end				
				self.feature_groups_elements.each do |fg|
					if fg.attribute('class').include?('active') == false						
						fg.button.click			
					end										
					case
					when fg.button.text.include?("SHAPE")
						shapes = self.shape_option_element.lis
						shape = shapes[rand(shapes.length)]
						shape.button.click
					when fg.button.text.include?("STEEL")
						steel = self.steel_option_elements
						steel.sample.button.click		
					when fg.button.text.include?("MATERIAL")
						material = self.material_option_elements
						material.sample.click
					when fg.button.text.include?("CLIP")
						clip = self.clip_option_elements
						clip.sample.click
					when fg.button.text.include?("STEEL") == false && fg.button.text.include?("MATERIAL") == false && fg.button.text.include?("CLIP") == false
						color = self.color_option_elements
						color.sample.button.click
					end
				end
			end
		end
		sleep 1
		knife_price = self.ui_price
		self.buy
		sleep 1
		self.check_checkbox
		self.add_to_cart
		sleep 1

		self.wait_until { $driver.alert.exists? }
		if $driver.alert.exists?
			alert_string = $driver.alert.text.scan(/\{.*?\}.+/)
			puts alert_string[0]
			response = JSON.parse(alert_string[0])
			$driver.alert.close
		end
		# puts "#{knife_id} | #{knife_price}"
		knife_id = response['data']['custom_knife_id']
		remote_price = response['data']['remote_price']
		sleep 1
		return knife_id, knife_price, remote_price
	end
end

