require 'page-object'
require './lib/pages/gkelite/gk_shopify_base_page'

class GKPaymentPage < GKShopifyBasePage
	include PageObject

radio(:credit_card_radio, css: "#app > div.checkout-wrapper.container > div.checkout-container > div:nth-child(2) > div.col-xs-12.col-md-6 > form > div.payment-type-container > div > div:nth-child(1) > label > input[type='radio']")
radio(:po_number_radio, css: "#app > div.checkout-wrapper.container > div.checkout-container > div:nth-child(2) > div.col-xs-12.col-md-6 > form > div.payment-type-container > div > div:nth-child(2) > label > input[type='radio']")
radio(:check_moneyorder_radio, css: "#app > div.checkout-wrapper.container > div.checkout-container > div:nth-child(2) > div.col-xs-12.col-md-6 > form > div.payment-type-container > div > div:nth-child(3) > label > input[type='radio']")
radio(:terms_radio, css: "#app > div.checkout-wrapper.container > div.checkout-container > div:nth-child(2) > div.col-xs-12.col-md-6 > form > div.payment-type-container > div > div:nth-child(4) > label > input[type='radio']")
text_field(:card_name, name: "cardName")
text_field(:card_number, name: "cardNum")
text_field(:card_date_month, name: "dateMonth")
text_field(:card_date_year, name: "dateYear")
text_field(:card_security_code, name: "ccv")
checkbox(:same_address, name: "billToShip")
select_list(:save_card, name: "saveCard")
text_field(:giftcard_number, name: "giftCard")
text_field(:need_by_date, name: "needByDate")
button(:place_order, css: "#app > div.checkout-wrapper.container > div.checkout-container > div:nth-child(2) > div.col-xs-12.col-md-6 > form > div.text-right.cta-wrapper > button")
div(:spinner, class: "loader-container")
span(:warning, class: "help is-danger")
div(:loader, class: "loader")



def fill_credit_card
	self.card_name = 'Testy McTesterson'
	self.card_number = '4111111111111111'
	self.card_date_month = '09'
	self.card_date_year = '19'
	self.card_security_code = '111'
end


end