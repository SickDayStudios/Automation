require 'page-object'
require './lib/pages/base_page'


class PreviewBasePage < BasePage
	include PageObject

	unordered_list(:container, css: "body > div.container > ul")
	select_list(:client_dropdown, id: "SelectedClientHandle")
	div(:page_load, class: "shader-wrapper")

	def clients
		self.client_dropdown_options.to_a
	end

	def product_links
		self.container_element.list_items.to_a
	end

end