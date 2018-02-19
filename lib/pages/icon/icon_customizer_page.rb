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
	button(:add_to_bag, class: ["ui--actions__useraction ui--actions__useraction--addtobag"])
	button(:share, class: ["ui--actions__useraction--share"])
	divs(:color_modal, class: ["ui--swatchgroup--bigset"])
	spans(:swatch_names, class: ["swatch-name"])
	span(:test, css: "#mCSB_1_container > div > div.color-swatch.active.first-swatch.darkCheck > span")
	div(:logo_colors, class: ["ui--toggleswatch"])
	div(:loading_bar, class: ["customizer__loadscreen__progress__meter"])
	div(:high_demand, class: ["spectrum-overlay overlay--high-demand"])
	div(:close_high_demand, class: ["overlay__close"])
	div(:selected_color, class: ["ui--commonscrollergroup__label"])
	span(:pattern_name, class: ["ng-binding"])


	def create_random_shoe
		self.wait_until {self.loading_bar_element.exists?}
		self.wait_while {self.loading_bar_element.exists? == false}
		self.wait_while {self.loading_bar_element.visible?}
		sleep 1
		if self.high_demand?
			self.close_high_demand_element.click
		end
		@h = Hash.new{|hsh,key| hsh[key] = [] }
		sleep 1
		self.color_tabs_elements.each do |e|
			self.wait_while { e.element.stale? }
			self.wait_until { e.element.present? }
			e.element.click
			sleep 1

			if e == color_tabs_elements.first
				self.upper_options_elements.present? == true
				pattern = self.upper_options_elements
				pattern[1].click
				sleep 1
				self.patterns_elements.sample.click
				self.edit_pattern_element.click
				sleep 1
				self.pattern_colors_elements.each do |area|
					self.wait_while(timeout: 60) { area.stale? }
					area.click
					option = self.pattern_color_modal_element.children.sample
					self.wait_while { option.stale? }
					option.scroll_into_view
					option.click
					puts "#{e.text} | #{option.text}"	
				end
				self.done_element.click
				sleep 1	
				self.exit_pattern_element.click
				sleep 1
			end

			if self.logo_colors_element.exists?
				self.logo_colors_element.children.zip(self.color_modal_elements).each do |layer, colors|
					if layer.element.attribute_value('class').include?('active') == false
						layer.element.click
						sleep 1
						logo_color = nil
						logo_color = colors.children.sample
						logo_color.element.scroll_into_view
						logo_color.element.click
					else
						logo_color = nil
						logo_color = colors.children.sample
						logo_color.element.scroll_into_view
						logo_color.element.click
						puts "#{e.text} | #{self.selected_color_element.inner_html}"
					end
				end
			end

			if e.text.include?('TEXT')
			end

			if e.text == 'SIZE'
				sizes = self.size_options_element.lis
				size = sizes[rand(sizes.length)]
				puts "SIZE | #{size.text}"
				size.click
			end

			if (self.color_modal_elements.present? && self.logo_colors_element.exists? == false && e.text.include?('TEXT') == false && ((e.text == 'SIZE') == false))
				self.swatch_names_elements.each do |c|
					@h["#{e.text}"] << c.inner_html	
				end
				self.color_modal_elements.each do |colors|
					color = colors.children.sample
					color.element.scroll_into_view
					color.element.click
				end
				puts "#{e.text} | #{self.selected_color_element.inner_html}"
			end

		end
		self.share_element.click
		current_url = self.url
		self.wait_while(timeout: 60) {self.url == current_url}
		return self.url.scan(/\w*[0-9]\w*/),@h
	end
end