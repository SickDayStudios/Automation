module GKLoginPopup

	include PageObject

	div(:close, class: "close")
	link(:create_account, id: "customer_register_link")
	button(:guest_checkout, class: "login-page__guest-checkout")
	text_field(:email, id: "CustomerEmail")
	text_field(:password, id: "CustomerPassword")
	checkbox(:remember_me, id: "remember-me")
	link(:forgot_password, id: "RecoverPassword")
	button(:sign_in, value: "Sign In")

	div(:login_error, class: ["errors"])

	text_field(:first_name, id: "FirstName")
	text_field(:last_name, id: "LastName")
	text_field(:set_email, id: "Email")
	text_field(:set_password, id: "CreatePassword")
	button(:create_account_button, css: "#create_customer > li:nth-child(8) > input[type='submit']")
	link(:return_to_store, css: "#create_customer > li:nth-child(9) > a")
	link(:register_account_button, id: "customer_register_link")
	radio(:email_login_radio, id: "LoginChoiceEmail")


	def login_with(email, password)
		self.select_email_login_radio
		self.email = email
		self.password = password
		self.sign_in
	end

end