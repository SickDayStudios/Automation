require './lib/helpers/gkelite/gk_header'
require './lib/helpers/gkelite/gk_footer'
require './lib/helpers/gkelite/gk_login_popup'
require './lib/pages/gkelite/gk_shopify_base_page'

class GKCartPage < GKShopifyBasePage
	include GKHeader
	include GKFooter
	include PageObject
	include GKLoginPopup



button(:secure_checkout, css: "#site-container > div.container > div > div > form > div > div.col-xs-12.col-sm-4.shopping-cart__secondary > ul > li:nth-child(2) > button")
link(:update_item, css: "#site-container > div.container > form > div > div.col-xs-12.col-sm-8.shopping-cart__primary > div.shopping-cart__item > div:nth-child(1) > div.col-xs-12.col-sm-9 > div:nth-child(4) > div.col-xs-8.col-sm-5.shopping-cart__update-remove > a:nth-child(1)")
link(:remove_item, class: "shopping-cart__update-remove__remove")
div(:signin_popup, id: "signin-or-guest")
div(:login_popup, class: ["container login-page"])

end