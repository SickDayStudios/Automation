class TimexCustomizer < BasePage
	include PageObject

	# => Buttons
	button :case_tab, text: "Case"
	button :dial_tab, text: "Dial"
	button :strap_tab, text: "Strap"
	button :engraving_tab, text: "Engraving"
	button :engrave_initials, text: "Initials"
	button :engrave_message, text: "Message"
	button :engrave_none, text: "None"

	# => Lists/Swatches
	ul :design_swatches, class: ["selection-list ft-component__selection-list"]
	ul :color_swatches, class: ["selection-list ft-color__selection-list"]
	ul :text_options, class: ["ft-text-type__selection-list"]
	select_list :font_dropdown, class: ["ft-font__selection-dropdown"]
	text_field :text, id: "textFeatureString"
	div :loading_bar, class: ["hero__miniloader"]

	def iterate_tab
		self.design_swatches_element.lis.each do |li|
			li.button.click
			self.color_swatches_element.lis.each do |item|
				item.button.click
			end
		end
	end

	def text_tab
		self.engrave_initials
		self.text = "123"
		self.font_dropdown_options.each do |opt|
			self.font_dropdown = opt
		end
		self.engrave_message
		self.text = "1234567890"
		self.font_dropdown_options.each do |opt|
			self.font_dropdown = opt
		end
		self.engrave_none
		sleep 2
	end
end