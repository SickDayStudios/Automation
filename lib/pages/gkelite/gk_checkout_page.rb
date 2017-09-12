require 'page-object'
require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_header'

class GKCheckoutPage < GKShopifyBasePage
	include PageObject
	include GKHeader

	# Customer Info
link(:checkout_login, css: "#site-container > div.container > div > div > div > div.main > div.main__content > div > form > div.step__sections > div.section.section--contact-information > div.section__header > div > p > a")
text_field(:checkout_email, id: "checkout_email")
text_field(:checkout_first_name, id: "checkout_shipping_address_first_name")
text_field(:checkout_last_name, id: "checkout_shipping_address_last_name")
text_field(:shipping_line_one, id: "checkout_shipping_address_address1")
text_field(:shipping_line_two, id: "checkout_shipping_address_address2")
text_field(:shipping_city, id: "checkout_shipping_address_city")
select_list(:shipping_country, id: "checkout_shipping_address_country")
select_list(:shipping_state, id: "checkout_shipping_address_province")
text_field(:shipping_zip, id: "checkout_shipping_address_zip")
link(:return_to_previous, class: "step__footer__previous-link")
button(:continue_to, class: "step__footer__continue-btn btn ")
link(:edit_cart, css: "#site-container > div.container > div > div > div > div.sidebar > div > div.order-summary__section__content--custom > h2 > a")

	# Shipping Method
div(:shipping_section, class: "section section--shipping-method")
radio(:ship_choice, class: "input-radio")

link(:edit_address, css: "#site-container > div.container > div > div > div > div.main > div.main__content > div > form > div.step__sections > div.content-box > div > div > div.content-box__header__action > a")
span(:shipping_cost, css: "#site-container > div.container > div > div > div > div.sidebar > div > div.order-summary.order-summary--is-collapsed > div > div.order-summary__section.order-summary__section--total-lines > table > tbody > tr.total-line.total-line--shipping > td.total-line__price > span")

	# Payment Method
radio(:same_address, id: "checkout_different_billing_address_false")
radio(:different_address, id: "checkout_different_billing_address_true")
text_field(:billing_first_name, id: "checkout_billing_address_first_name")
text_field(:billing_last_name, id: "checkout_billing_address_last_name")
text_field(:billing_address_line_one, id: "checkout_billing_address_address1")
text_field(:billing_address_line_two, id: "checkout_billing_address_address2")
text_field(:billing_city, id: "checkout_billing_address_city")
select_list(:billing_country, id: "checkout_billing_address_country")
select_list(:billing_state, id: "checkout_billing_address_province")
text_field(:billing_zip, id: "checkout_billing_address_zip")
list_item(:current_breadcrumb, class: "breadcrumb__item breadcrumb__item--current")
	# Checkout Redirect


	def random_shipping_method
		self.wait_until { self.ship_choice? }
		self.ship_choice_elements.to_a.sample.click
	end

	def fill_shipping_address
		self.checkout_email = 'cason.williams@pollinate.com'
		self.checkout_first_name = 'Testy'
		self.checkout_last_name = 'McTesterson'
		self.shipping_line_one = '1337 Testing Ave.'
		self.shipping_line_two = 'Suite 1337'
		self.shipping_city = 'Testland'
		self.shipping_zip = '97205'
	end

	def fill_billing_address
		self.billing_first_name = 'Testy'
		self.billing_last_name = 'McTesterson'
		self.billing_address_line_one = '1337 Testing Ave.'
		self.billing_address_line_two = 'Suite 1337'
		self.billing_city = 'Testland'
		self.billing_zip = '97205'
	end

end