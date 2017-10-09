module GKLoginPopup
	include PageObject


div(:close, class: "close")
link(:create_account, id: "customer_register_link")
button(:guest_checkout, class: "login-page__guest-checkout")
text_field(:email, id: "CustomerEmail")
text_field(:password, id: "CustomerPassword")
checkbox(:remember_me, id: "remember-me")
link(:forgot_password, id: "RecoverPassword")
button(:sign_in, css: "#customer_login > ul > li:nth-child(4) > input[type='submit']")

def login_with(email, password)
	self.email = email
	self.password = password
	self.sign_in
end

end