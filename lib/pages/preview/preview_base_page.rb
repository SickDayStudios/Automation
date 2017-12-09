require './lib/pages/asset_api_page'

class PreviewBasePage < BasePage::AssetAPI
	include PageObject

	select_list(:client_dropdown, id: "SelectedClientHandle")
	b(:handle, css: "#controls > div.asset-list > div > div.asset-header > b")
	div(:shader_properties, text: "Shader Properties")
	div(:json_manifest, text: "Manifest JSON")
	canvas(:webgl, css: "#WebGL-output > canvas")

	def clients
		self.client_dropdown_options.to_a
	end
end