require './lib/pages/gkelite/gk_shopify_base_page'
require 'page-object'
require "./lib/helpers/gkelite/gk_header"

class GKAccountPage < GKShopifyBasePage
	include PageObject
	include GKHeader


end