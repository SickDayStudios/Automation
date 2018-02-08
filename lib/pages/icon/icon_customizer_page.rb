class IconCustomizer < IconBasePage
	include PageObject

	divs(:color_tabs, class: ["customizer__controlpalette__navigation__tab"])
	divs(:color_swatches, class: ["color-swatch"])
	ul(:size_options, class: ["ui--shoesizes__content__selectionlist"])
	divs(:upper_options, class: ["ui--uppercontrols__splitcontrol--multimedia__link"])
	divs(:patterns, class: ["pattern-swatch"])
	div(:edit_pattern, class: ["expanded-feature__content__panel__edit-button active"])
	divs(:pattern_colors, class: ["patterncolor-swatch"])
	div(:pattern_color_modal, class: ["ui--swatchgroup__stacked"])
	div(:done, text: "DONE")
	div(:exit_pattern, class: ["expanded-feature__content__panel__backbutton"])
	button(:add_to_bag, class: ["ui--actions__useraction ui--actions__useraction--addtobag"])
	button(:share, class: ["ui--actions__useraction--share"])
	div(:color_modal, class: ["ui--swatchgroup--bigset"])
	spans(:swatch_names, class: ["swatch-name"])

	def get_colors
		self.color_tabs_elements.each do |e|
			self.wait_while { e.element.stale? }
			e.element.click			
			if (e.text == 'UPPER' || 'FOREFOOT') == false
				self.swatch_names.each do |color|



	def create_random_shoe
		pattern = self.upper_options_elements
		pattern[1].click		
		self.patterns_elements.sample.click		
		self.edit_pattern_element.click		
		self.pattern_colors_elements.each do |area|
			self.wait_while { area.stale? }
			area.click
			option = self.pattern_color_modal_element.children.sample
			option.element.scroll_into_view
			option.element.click			
		end
		self.done_element.click		
		self.exit_pattern_element.click		
		self.color_tabs_elements.each do |e|
			self.wait_while { e.element.stale? }
			e.element.click			
			if (e.text == 'UPPER' || 'FOREFOOT') == false
				if e.text.include?('SIZE')
					sizes = self.size_options_element.lis
					sizes[rand(sizes.length)].click					 
				else
					color = self.color_modal_element.children.sample
					color.element.scroll_into_view
					color.element.click
				end
			end
		end
		current_url = self.url
		self.share.click
		self.wait_while {self.url == current_url}
		return self.url.scan(/\w*[0-9]\w*/)
	end
end