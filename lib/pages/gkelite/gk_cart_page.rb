require 'page-object'
require './lib/helpers/gkelite/gk_header'
require './lib/helpers/gkelite/gk_footer'
require './lib/helpers/gkelite/gk_login_popup'
require './lib/pages/gkelite/gk_shopify_base_page'

class GKCartPage < GKShopifyBasePage
	include GKHeader
	include GKFooter
	include PageObject
	include GKLoginPopup



button(:secure_checkout, name: "checkout")
link(:update_item, css: "#site-container > div.container > form > div > div.col-xs-12.col-sm-8.shopping-cart__primary > div.shopping-cart__item > div:nth-child(1) > div.col-xs-12.col-sm-9 > div:nth-child(4) > div.col-xs-8.col-sm-5.shopping-cart__update-remove > a:nth-child(1)")
link(:remove_item, css: "#site-container > div.container > form > div > div.col-xs-12.col-sm-8.shopping-cart__primary > div.shopping-cart__item > div:nth-child(1) > div.col-xs-12.col-sm-9 > div:nth-child(4) > div.col-xs-8.col-sm-5.shopping-cart__update-remove > a:nth-child(2)")
link(:save_for_later, css: "#site-container > div.container > form > div > div.col-xs-12.col-sm-8.shopping-cart__primary > div.shopping-cart__item > div:nth-child(3) > div > a:nth-child(1)")
link(:add_more_sizes, css: "#site-container > div.container > form > div > div.col-xs-12.col-sm-8.shopping-cart__primary > div.shopping-cart__item > div:nth-child(3) > div > a:nth-child(2)")
link(:remove_from_cart, css: "#site-container > div.container > form > div > div.col-xs-12.col-sm-8.shopping-cart__primary > div.shopping-cart__item > div:nth-child(3) > div > a:nth-child(3)")
div(:signin_popup, id: "signin-or-guest")
div(:login_popup, class: ["container login-page"])

end