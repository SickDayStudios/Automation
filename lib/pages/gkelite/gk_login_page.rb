require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_login_popup'
require './lib/helpers/gkelite/gk_header'

class GKLoginPage < GKShopifyBasePage
	include PageObject
	include GKLoginPopup
	include GKHeader


	def quick_logout
		$driver.goto $base_url + '/account/logout'
	end

	def login_with(email, password)
		self.select_email_login_radio
		self.email = email
		self.password = password
		self.sign_in
	end

	def register_account
		self.first_name = 'Test'
		self.last_name = 'Test'
		self.set_email = 'test@test.com'
		self.set_password = 'gk123!@#'
		self.create_account_button
	end

	def header_login
		self.home_page
		self.header_signin
		self.select_email_login_radio
		self.login_with($username, $password)
	end
end