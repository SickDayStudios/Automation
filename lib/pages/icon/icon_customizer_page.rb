require "./lib/pages/icon/icon_base_page"

class IconCustomizer < IconBasePage
	include PageObject

	divs(:color_tabs, class: ["customizer__controlpalette__navigation__tab"])
	divs(:color_swatches, class: ["color-swatch"])
	ul(:size_options, class: ["ui--shoesizes__content__selectionlist"])
	divs(:upper_options, class: ["ui--uppercontrols__splitcontrol--multimedia__link"])
	div(:pattern_options, class: ["ui--uppercontrols__designoptions show-media-options"])
	divs(:patterns, class: ["pattern-swatch"])
	div(:edit_pattern, class: ["expanded-feature__content__panel__edit-button active"])
	divs(:pattern_colors, class: ["patterncolor-swatch"])
	div(:pattern_color_modal, class: ["ui--swatchgroup__stacked"])
	div(:done, text: "DONE")
	div(:exit_pattern, class: ["expanded-feature__content__panel__backbutton"])
	buttons(:add_to_bag, class: ["ui--actions__useraction ui--actions__useraction--addtobag"])
	button(:review_to_cart, class: ["overlay__product-info_button review-add-to-cart"])
	button(:share, class: ["ui--actions__useraction--share"])
	divs(:color_modal, class: ["ui--swatchgroup--bigset"])
	spans(:swatch_names, class: ["swatch-name"])
	span(:test, css: "#mCSB_1_container > div > div.color-swatch.active.first-swatch.darkCheck > span")
	div(:logo_colors, class: ["ui--toggleswatch"])
	div(:loading_bar, class: ["customizer__loadscreen__progress__meter"])
	div(:popup_overlay, class: ["spectrum-overlay"])
	div(:close_popup_overlay, class: ["overlay__close"])
	div(:selected_color, class: ["ui--commonscrollergroup__label"])
	span(:pattern_name, class: ["ng-binding"])
	divs(:multi_selected_color, class: ["ui--commonscrollergroup__label"])
	div(:asset_handle, class: ["customizer"])
	div(:replay_button, class: ["overlay__renderer_repeat ng-hide"])
	text_field(:email_field, id: "email")
	text_field(:password_field, id: "password")
	button(:login_button, class: ["login-btn gs-btn gs-btn--wide gs-btn--black"])
	div(:bag_popup_button, class: ["modal-ctas"])
	button(:proceed_to_checkout, class: ["checkout-btn gs-btn gs-btn--short"])
	text_field(:security_code, id: "securityCode")
	link(:print_receipt, class: ["print"])
	button(:place_order, class: ["btn btn-checkout"])
	div(:login_overlay, class: ["ngdialog-overlay"])
	link(:mini_cart_checkout, class: ["btn cart-checkout-btn"])
	button(:close_popup, css: "body > div.modal.visitor-messaging > div > button")
	span(:close_bag_popup, class: ["icon ua-close"])



	def create_random_shoe
# => wait until customizer is fully loaded
		self.wait_until {self.loading_bar_element.exists?}
		self.wait_while {self.loading_bar_element.exists? == false}
		self.wait_while {self.loading_bar_element.visible?}
# => if popup is present then close popup
		if self.popup_overlay_element.exists? && self.popup_overlay_element.present?
			self.close_popup_overlay_element.click
		end
# => defining hashes
		@h = Hash.new{ |hsh,key| hsh[key] = [] }
		@recipe = Hash.new{ |hsh,key| hsh[key] = [] }
		sleep 1
# => iterate over each section tab
		self.color_tabs_elements.each do |e|
			self.wait_while { e.element.stale? }
			self.wait_until { e.element.present? }
			e.element.click
# => if the first tab is selected, add a random pattern with colors			
			if e == color_tabs_elements.first
				self.upper_options_elements.present? == true
				pattern = self.upper_options_elements
				pattern[1].click
				self.patterns_elements.sample.click
				@recipe["#{e.text}"] = self.multi_selected_color_elements[0].text
				pat = self.multi_selected_color_elements[0].text
				self.edit_pattern_element.click
				self.pattern_colors_elements.each do |area|
					self.wait_while(timeout: 60) { area.stale? }
					area.click
					option = self.pattern_color_modal_element.children.sample
					self.wait_while { option.stale? }
					option.scroll_into_view
					option.click
					@recipe["#{pat}"] << self.multi_selected_color_elements[1].text	
				end
				self.done_element.click
				self.exit_pattern_element.click
			end
# => if multiple color options are present under the current tab, add multiple random colors
			if self.logo_colors_element.exists?
				self.logo_colors_element.children.zip(self.color_modal_elements).each do |layer, colors|
					if layer.element.attribute_value('class').include?('active') == false
						layer.element.click
						logo_color = nil
						logo_color = colors.children.sample
						logo_color.element.scroll_into_view
						logo_color.element.click
						colors.children.each do |c|
							c.spans.each do |span|
								@h["#{layer.text.upcase}"] << span.inner_html
							end
						end
						@recipe["#{layer.text}"] = self.selected_color_element.inner_html
					else
						logo_color = nil
						logo_color = colors.children.sample
						logo_color.element.scroll_into_view
						logo_color.element.click
						colors.children.each do |c|
							c.spans.each do |span|
								@h["#{e.text}"] << span.inner_html
							end
						end
						@recipe["#{layer.text}"] = self.selected_color_element.inner_html
					end
				end
			end
# => if tab text displays 'TEXT' then break the loop
			if e.text.include?('TEXT')
			end
# => if tab text displays 'SIZE' then select a random size
			if e.text == 'SIZE'
				sizes = self.size_options_element.lis
				size = sizes[rand(sizes.length)]
				@recipe["#{e.text}"] = size.text
				size.click
			end
# => if tab color selection is a single row of color swatches, select a random color swatch
			if (self.color_modal_elements.present? && self.logo_colors_element.exists? == false && e.text.include?('TEXT') == false && ((e.text == 'SIZE') == false))
				self.swatch_names_elements.each do |c|
					@h["#{e.text}"] << c.inner_html	
				end
				self.color_modal_elements.each do |colors|
					color = colors.children.sample
					color.element.scroll_into_view
					color.element.click
				end
				@recipe["#{e.text}"] = self.selected_color_element.inner_html
			end
		end
# => complete order to generate spec/packlist
		handle = (self.asset_handle_element.attribute_value('style').scan(/uaf-prs-\w+-\w+/))
		self.add_to_bag_elements[1].click
		sleep 1
		if self.popup_overlay_element.exists? && self.popup_overlay_element.present?
			puts "ORDERS HAVE BEEN TURNED OFF!!!"
			$driver.quit
		else
			self. wait_while {self.replay_button?}
			recipe_id = (self.url.scan(/\w+......$/))
			self.review_to_cart_element.click
			self.wait_until {self.login_button_element.visible?}
			self.email_field = "icon.user2@ua.com"
			self.password_field = "password"
			self.login_button_element.click
			sleep 3
			self.goto("https://staging.underarmour.com/en-us/cart")
			self.refresh
			self.proceed_to_checkout_element.click
			# if self.close_popup_element.exists? && self.close_popup_element.present?
			# 	self.close_popup
			# end
			self.security_code = "111"
			self.place_order_element.click
			sleep 5
			return recipe_id,handle,@h,@recipe
		end
	end
end