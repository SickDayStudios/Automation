require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_login_popup'
require './lib/helpers/gkelite/gk_header'

class GKLoginPage < GKShopifyBasePage
	include PageObject
	include GKLoginPopup
	include GKHeader


# Login Landing Page

text_field(:email, id: "CustomerEmail")
text_field(:password, id: "CustomerPassword")
checkbox(:remember_me, id: "remember-me")
link(:forgot_password, id: "RecoverPassword")
button(:sign_in_button, css: "#customer_login > ul > li:nth-child(4) > input[type='submit']")
div(:login_error, class: ["errors"])

# Register Account Page
text_field(:first_name, id: "FirstName")
text_field(:last_name, id: "LastName")
text_field(:set_email, id: "Email")
text_field(:set_password, id: "CreatePassword")
button(:create_account_button, css: "#create_customer > li:nth-child(8) > input[type='submit']")
link(:return_to_store, css: "#create_customer > li:nth-child(9) > a")
link(:register_account_button, id: "customer_register_link")


	def quick_logout
		$driver.goto $base_url + '/account/logout'
	end

	def login_with(email, password)
		self.email = email
		self.password = password
		self.sign_in_button
	end

	def register_account
		self.first_name = 'Test'
		self.last_name = 'Test'
		self.set_email = 'test@test.com'
		self.set_password = 'gk123!@#'
		self.create_account_button
	end
end