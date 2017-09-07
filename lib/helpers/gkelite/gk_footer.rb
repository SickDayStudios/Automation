require 'page-object'
require './lib/pages/gkelite/gk_shopify_base_page'


module GKFooter
	include PageObject



text_field(:email_field,            id: "Email")
button(:submit_email,            	id: "subscribe")


end