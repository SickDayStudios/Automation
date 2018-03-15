require "./lib/pages/icon/icon_base_page"

class IconCustomizer < IconBasePage
	include PageObject
	include ChunkyPNG::Color

	div(:size_tab, 					text: 	"SIZE")
	divs(:color_tabs, 				class: ["customizer__controlpalette__navigation__tab"])
	divs(:color_swatches, 			class: ["color-swatch"])
	ul(:size_options, 				class: ["ui--shoesizes__content__selectionlist"])
	divs(:upper_options, 			class: ["ui--uppercontrols__splitcontrol--multimedia__link"])
	div(:pattern_options, 			class: ["ui--uppercontrols__designoptions show-media-options"])
	divs(:patterns, 				class: ["pattern-swatch"])
	div(:edit_pattern, 				class: ["expanded-feature__content__panel__edit-button active"])
	divs(:pattern_colors, 			class: ["patterncolor-swatch"])
	div(:pattern_color_modal, 		class: ["ui--swatchgroup__stacked"])
	div(:done, 						text: 	"DONE")
	div(:exit_pattern, 				class: ["expanded-feature__content__panel__backbutton"])
	buttons(:add_to_bag, 			class: ["ui--actions__useraction ui--actions__useraction--addtobag"])
	button(:review_to_cart, 		class: ["overlay__product-info_button review-add-to-cart"])
	button(:share, 					class: ["ui--actions__useraction--share"])
	divs(:color_modal, 				class: ["ui--swatchgroup--bigset"])
	spans(:swatch_names, 			class: ["swatch-name"])
	div(:logo_colors, 				class: ["ui--toggleswatch"])
	div(:loading_bar, 				class: ["customizer__loadscreen__progress__meter"])
	div(:popup_overlay, 			class: ["spectrum-overlay"])
	div(:close_popup_overlay, 		class: ["overlay__close"])
	div(:selected_color, 			class: ["ui--commonscrollergroup__label"])
	span(:pattern_name, 			class: ["ng-binding"])
	divs(:multi_selected_color, 	class: ["ui--commonscrollergroup__label"])
	div(:asset_handle, 				class: ["customizer"])
	div(:replay_button, 			class: ["overlay__renderer_repeat ng-hide"])
	text_field(:email_field, 		id: 	"email")
	text_field(:password_field, 	id: 	"password")
	button(:login_button, 			class: ["login-btn gs-btn gs-btn--wide gs-btn--black"])
	div(:bag_popup_button, 			class: ["modal-ctas"])
	button(:proceed_to_checkout, 	class: ["checkout-btn gs-btn gs-btn--short"])
	text_field(:security_code, 		id: 	"securityCode")
	link(:print_receipt, 			class: ["print"])
	button(:place_order, 			class: ["btn btn-checkout"])
	div(:login_overlay, 			class: ["ngdialog-overlay"])
	link(:mini_cart_checkout, 		class: ["btn cart-checkout-btn"])
	button(:close_popup, 			css: 	"body > div.modal.visitor-messaging > div > button")
	span(:close_bag_popup, 			class: ["icon ua-close"])
	span(:product_sku_value, 		class: ["product-sku-value"])
	div(:canvas, 					id: 	"testtarget")
	button(:switch_shoe, 			class: ["ui--stance__shoe"])
	div(:first_data_url, 			class: ["primary"])
	span(:product_size, 			class: ["product-size-value"])
	span(:cart_price, 				class: ["price"])
	span(:address_name, 			class: ["address-names"])
	span(:order_number, 			class: ["order-receipt-message-order-number"])
	h1(:deprecated_color,			id:    "ngdialog1-aria-labelledby")




	## => TODO: iterate over each file in dir1 and dir2
	def image_diff(recipe_id)
		self.adjust_fe_images(recipe_id)
		n = 0
		Dir["#{$screenshotfolder}/#{recipe_id}/FE/*.png"].zip(Dir["#{$screenshotfolder}/#{recipe_id}/BER/*.png"]).each do |fe, ber|
			n += 1
			images = [
				ChunkyPNG::Image.from_file("#{fe}"),
				ChunkyPNG::Image.from_file("#{ber}")
			]
			output = ChunkyPNG::Image.new(images.first.width, images.last.width, WHITE)

			diff = []

			images.first.height.times do |y|
				images.first.row(y).each_with_index do |pixel, x|
					unless pixel == images.last[x,y]
						score = Math.sqrt(
							(r(images.last[x,y]) - r(pixel)) ** 2 +
							(g(images.last[x,y]) - g(pixel)) ** 2 +
							(b(images.last[x,y]) - b(pixel)) ** 2
							) / Math.sqrt(MAX ** 2 * 3)

						output[x,y] = grayscale(MAX - (score * 255).round)
						diff << score
					end
				end
			end

			puts "pixels (total):     #{images.first.pixels.length}"
			puts "pixels changed:     #{diff.length}"
			puts "image changed (%): #{(diff.inject {|sum, value| sum + value} / images.first.pixels.length) * 100}%"

			output.save("#{$screenshotfolder}/#{recipe_id}/diff-#{n}.png")
		end
	end

	def adjust_fe_images(recipe_id)
		Dir["#{$screenshotfolder}/#{recipe_id}/FE/*.png"].each do |img|
			new_image = Magick::Image.read(img)[0]
			new_image.resize_to_fit!(512,512)
			new_image.sharpen(radius=0.0, sigma=1.0)
			new_image.write img
		end
	end


	def get_rasters(recipe_id)
		@rasters = Array.new
		case ENV['ENVIRONMENT'].to_sym
		when :test then response = JSON.parse(RestClient.get("test.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		when :staging then response = JSON.parse(RestClient.get("staging.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		when :prod then  response = JSON.parse(RestClient.get("api.spectrumcustomizer.com/api/recipesets/readable/#{recipe_id}"))
		end
		response['contents']['recipes'].each do |recipes|
			recipes['recipe']['recipeData'].each do |recipeData|
				recipeData['childFeatures'].each do |childFeatures|

					if childFeatures['featureHandle'].include?("raster")
						childFeatures['values'].each do |values|
							@rasters.push(values['valueString'])
						end
					end

				end
			end
		end
		return @rasters
	end

	def download_ber_images(recipe_id)
		rasters = self.get_rasters(recipe_id)

		unless File.directory?("#{$screenshotfolder}/#{recipe_id}/BER/")
			FileUtils.mkdir_p("#{$screenshotfolder}/#{recipe_id}/BER/")
		end

		@n = 0

		rasters.each do |r|
			@n += 1

			File.open("#{$screenshotfolder}/#{recipe_id}/BER/#{@n}.png", 'wb') do |f|
				f.write open(r).read
			end

		end
	end

	def verify_ber(style)
		case ENV['ENVIRONMENT'].to_sym
		when :test then url = "http://demo.spectrumcustomizer.com/under-armour/test/uaf/frontend/?style=#{style}&debug-canvas-data=true"
		when :staging then url = "http://demo.spectrumcustomizer.com/under-armour/staging/uaf/frontend/?style=#{style}&debug-canvas-data=true"
		when :prod then url = "http://demo.spectrumcustomizer.com/under-armour/production/uaf/frontend/?style=#{style}&debug-canvas-data=true"
		end
		self.goto(url)
		sleep 1
		self.wait_until {self.loading_bar_element.exists?}
		self.wait_while(timeout: 60) {self.loading_bar_element.visible?}
		self.wait_until {self.upper_options_elements.present?}
		self.wait_until {self.color_tabs_elements.present?}
		sleep 5

		if self.close_popup_overlay_element.exists? && self.close_popup_overlay_element.present?
			self.close_popup_overlay_element.click
		end

		old_url = $driver.url

		pattern = self.upper_options_elements
		
		pattern[1].click
		sleep 1
		self.patterns_elements.sample.click
		sleep 2
		self.edit_pattern_element.click
		sleep 1
		self.pattern_colors_elements.each do |area|
			self.wait_while(timeout: 60) { area.stale? }
			area.click
			sleep 1
			option = self.pattern_color_modal_element.children.sample
			option.scroll_into_view
			option.click
			sleep 1
		end

		self.done_element.click
		
		sleep 1

		first = self.first_data_url

		@right_shoe = Array.new
		@left_shoe = Array.new

		self.canvas_element.children.each do |canv|
			@right_shoe.push(canv.inner_html)
		end

		self.exit_pattern_element.click

		self.switch_shoe

		self.wait_while {self.first_data_url == first}

		self.canvas_element.children.each do  |canv|
			@left_shoe.push(canv.inner_html)
		end

		self.size_tab_element.click
		
		sizes = self.size_options_element.lis
		size = sizes[rand(sizes.length)]
		size.click
		
		self.share
		self.wait_while {$driver.url == old_url}

		recipe_id = (self.url.scan(/\w+......$/))

		unless File.directory?("#{$screenshotfolder}/#{recipe_id[0]}/FE/")
			FileUtils.mkdir_p("#{$screenshotfolder}/#{recipe_id[0]}/FE")
		end

		@n = 0
		@left_shoe.each do |c|
			@n += 1
			left_image_data = Base64.decode64(c['data:image/png;base64,'.length .. -1])
			File.open("#{$screenshotfolder}/#{recipe_id[0]}/FE/#{@n}.png", 'wb+') do |f|
				f.write left_image_data
			end
		end

		@right_shoe.each do |c|
			@n += 1
			right_image_data = Base64.decode64(c['data:image/png;base64,'.length .. -1])
			File.open("#{$screenshotfolder}/#{recipe_id[0]}/FE/#{@n}.png", 'wb+') do |f|
				f.write right_image_data
			end
		end

		self.download_ber_images(recipe_id[0])
		self.image_diff(recipe_id[0])
	end


	def create_random_shoe
		puts "#{Time.now.strftime('		%I:%M:%S%p')}".blue
		@recipe = Hash.new{ |hsh,key| hsh[key] = [] }
		sleep 1
		self.wait_until {self.loading_bar_element.exists?}
		self.wait_while {self.loading_bar_element.visible?}
		self.wait_until {self.upper_options_elements.present?}
		if self.close_popup_overlay_element.exists? && self.close_popup_overlay_element.present?
			self.close_popup_overlay_element.click
		end
		sleep 1
		if self.close_popup_overlay_element.exists? && self.close_popup_overlay_element.present?
			self.close_popup_overlay_element.click
		end
		self.color_tabs_elements.each do |e|
			self.wait_while { e.element.stale? }
			self.wait_until { e.element.present? }
			e.element.click		
			if e == color_tabs_elements.first
				pattern = self.upper_options_elements
				pattern[1].click
				sleep 1
				self.patterns_elements.sample.click
				sleep 1
				self.edit_pattern_element.click
				sleep 1
				self.pattern_colors_elements.each do |area|
					self.wait_while(timeout: 60) { area.stale? }
					area.click
					option = self.pattern_color_modal_element.children.sample
					option.scroll_into_view
					option.click
				end
				@recipe["#{e.text.downcase}"] = self.multi_selected_color_elements[0].text	
				sleep 1
				self.done_element.click
				sleep 1
				self.exit_pattern_element.click
				sleep 1
			end
			if self.logo_colors_element.exists?
				self.logo_colors_element.children.zip(self.color_modal_elements).each do |layer, colors|
					if layer.element.attribute_value('class').include?('active') == false
						layer.element.click
						logo_color = nil
						logo_color = colors.children.sample
						logo_color.element.scroll_into_view
						logo_color.element.click
						@recipe["#{layer.text.downcase}"] = self.selected_color_element.inner_html
					else
						logo_color = nil
						logo_color = colors.children.sample
						logo_color.element.scroll_into_view
						logo_color.element.click
						@recipe["#{layer.text.downcase}"] = self.selected_color_element.inner_html
					end
				end
			end
			if e.text.include?('TEXT')
			end
			if e.text == 'SIZE'
				sizes = self.size_options_element.lis
				size = sizes[rand(sizes.length)]
				@size = size.text
				size.click
			end
			if (self.color_modal_elements.present? && self.logo_colors_element.exists? == false && e.text.include?('TEXT') == false && ((e.text == 'SIZE') == false))
				self.color_modal_elements.each do |colors|
					color = colors.children.sample
					color.element.scroll_into_view
					color.element.click
				end
				@recipe["#{e.text.downcase}"] = self.selected_color_element.inner_html
			end
		end
		self.add_to_bag_elements[1].click
		sleep 1
		self.wait_until {self.replay_button?}
		self.wait_while {self.replay_button?}
		recipe_id = (self.url.scan(/\w+......$/))
		self.review_to_cart_element.click
		if self.login_button_element.exists?
			self.wait_until {self.login_button_element.visible?}
			self.email_field = "icon.user2@ua.com"
			self.password_field = "password"
			self.login_button_element.click
			sleep 3
		end
		BasePage.print_js_errors
		case ENV['ENVIRONMENT'].to_sym
			when :staging
				self.goto("https://staging.underarmour.com/en-us/cart")
				self.goto("https://staging.underarmour.com/en-us/cart")
			when :prod
				self.goto("https://www.underarmour.com/en-us/cart")
				self.goto("https://www.underarmour.com/en-us/cart")
		end
		self.proceed_to_checkout_element.click
		@name = self.address_name
		@sku = self.product_sku_value
		@size = self.product_size
		self.security_code = "111"
		self.place_order_element.click
		sleep 2
		@order_number = self.order_number
		@price = self.cart_price_element.inner_html
		puts "#{Time.now.strftime('		%I:%M:%S%p')}".blue
		return {:id => recipe_id[0],
				:recipe => @recipe,
				:size => @size,
				:sku => @sku,
				:price =>@price,
				:name => @name,
				:order => @order_number}
	end
end