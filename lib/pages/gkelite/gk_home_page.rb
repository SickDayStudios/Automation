require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_header'


class GKHomePage < GKShopifyBasePage
	include GKHeader
	include PageObject


	def enter_password
		self.password = "iawhao"
		self.enter
	end
end