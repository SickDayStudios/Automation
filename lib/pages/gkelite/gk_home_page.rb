require 'page-object'
require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_header'
require './lib/helpers/gkelite/gk_footer'

class GKHomePage < GKShopifyBasePage
	include GKFooter
	include GKHeader
	include PageObject


end