require './lib/helpers/gkelite/customizer_ui'
require './lib/helpers/gkelite/gk_search_filters'
require './lib/pages/gkelite/gk_shopify_base_page'

### Define Page Class
class CustomizerPage < GKShopifyBasePage
	include PageObject
	include CustomizerUI
	include GKSearchFilters

	canvas(:page_load, id: "hero-canvas")
	div(:load_failed, css: "#gk-custom-app-vue > div > div > div > div")
	span(:spinner_precentage, class: ["spinner-percentage"])
	
	## Design & Color ##
	checkbox(:disclaimer_checkbox, id: "disclaimer")
	button(:start_over, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(1)")
	button(:undo, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(2)")
	button(:zoom_in, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(3)")
	button(:zoom_out, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(4)")
	button(:share_design_button, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-share__design > button")
	button(:save_design_button, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-save__design > div > button:nth-child(1)")
	button(:save_design_dropdown, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-save__design > div > button.c-save__as__dropdown__arrow")
	button(:save_as_design, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-save__design > button")
	divs(:swatch_name, class: ["c-color-modal__swatch-name"])
	links(:accordians, class: ["c-component__heading"])
	select_lists(:dropdown, class: ["dropdown-select"])
	link(:edit_color, text: "Edit")
	div(:close_modal, class: ["c-close-modal"])


	
	## Navigation Buttons ##
	button(:embellishments_button, text: "Embellishments")
	button(:design_color_button, css: "#navlink-design > button:nth-child(1)")
	button(:additional_options_button, text: "Additional Options")
	button(:size_alterations_button, css: "#navlink-sizes-and-alterations > button")


	## Header Breadcrumbs ##
	button(:breadcrumb_design, css: "#breadcrumb-design > button")
	button(:breadcrumb_embellishments, css: "#breadcrumb-embellishments > button")
	list_item(:disabled_breadcrumb_embellishments, id: "breadcrumb-embellishments")
	button(:breadcrumb_additional_options, css: "#breadcrumb-additional-options > button")
	list_item(:disabled_breadcrumb_additional_options, id: "breadcrumb-additional-options")
	button(:breadcrumb_sizes_alterations, css: "#breadcrumb-sizes-and-alterations > button")
	list_item(:disabled_breadcrumb_sizes_alterations, id: "breadcrumb-sizes-and-alterations")

	## Sizes & Alterations Popup ##
	div(:size_alterations_popup, css: "#gk-custom-app-vue > div > div > div > div > div")
	checkbox(:popup_checkbox_one, css: "#gk-custom-app-vue > div > div > div > div > div > div > ul > li:nth-child(1) > input[type='checkbox']")
	checkbox(:popup_checkbox_two, css: "#gk-custom-app-vue > div > div > div > div > div > div > ul > li:nth-child(2) > input[type='checkbox']")
	button(:popup_cancel_button, css: "#gk-custom-app-vue > div > div > div > div > div > div > div > span:nth-child(1) > button")
	button(:popup_next_button, css: "#gk-custom-app-vue > div > div > div > div > div > div > div > span:nth-child(2) > button")
	span(:disabled_next_button, css: "#gk-custom-app-vue > div > div > div > div > div > div > div > span.disabled")
	span(:saving_design, css: "#gk-custom-app-vue > div > div > div > div > div > h2 > span")
	div(:saving_popup, class: ["mask c-save"])
	div(:selected_style, class: ["c-customizer__menu"])


	## MISC
	div(:page_load, id: "site-wrapper")
	div(:svg_viewer, class: ["svg-viewer-container"])
	div(:error_message, class: ["error-message"])
	div(:load_complete, class: ["gk-custom-app-loader loaded hidden"])
	div(:error_tooltip, class: ["c-tooltip__error__container"])


	def missing_blob
		$driver.element(:tag_name, "code")
	end

	def svg
		$driver.element(:tag_name, "svg")
	end

	def back_side
		$driver.element(id: /^Back/)
	end

	def front_side
		$driver.element(id: /^Front/)
	end

	def silhouette
		$driver.element(id: 'Silhouette')
	end

	def get_color_code(name, id)
		url = "https://staging-gkelite.pollinate.com/collections/#{id}?view=product"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		specs = JSON.parse(response)
		return specs["colors"]["#{name}"]["erp_color_code"]
	end


	def get_data(id)
		@arr = Array.new
		url = "https://staging-gkelite.pollinate.com/collections/#{id}?view=product"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		specs = JSON.parse(response)
		specs["colors"].each_key do |x|
			@arr.push(specs["colors"]["#{x}"]["erp_color_code"])
		end
		return @arr
	end

	def get_back_color_ids
		@arr = Array.new
		self.back_side.elements(:tag_name, "g").each do |x|
			@arr.push(x.id)
		end
		return @arr.reject(&:empty?)
	end

	def get_front_color_ids
		@arr = Array.new
		self.front_side.elements(:tag_name, "g").each do |x|
			@arr.push(x.id)
		end
		return @arr.reject(&:empty?)
	end


	def quick_custom_asset
		self.wait_until { self.disclaimer_checkbox? }
		self.check_disclaimer_checkbox
		sleep 1
		self.breadcrumb_sizes_alterations_element.click
	end

end