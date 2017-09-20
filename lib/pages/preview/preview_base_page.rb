require 'page-object'
require './lib/pages/base_page'


class PreviewBasePage < BasePage
	include PageObject

	select_list(:client_dropdown, id: "SelectedClientHandle")
	div(:asset_load, class: "asset-list")

	def clients
		self.client_dropdown_options.to_a
	end

end