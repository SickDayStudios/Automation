require './lib/pages/base_page'
require './lib/helpers/uau/uau_garments'
require 'page-object'

class UAUBasePage < BasePage
	include UAUGarments
	include PageObject

element(:loader, tag_name: "uau-loader", class: "loaded")
div(:product_image, class: ["product__image"])
button(:save, class: "save")
text_field(:name_design, name: "name-design")
button(:submit, text: "SUBMIT")
button(:select_product, text: "Select")

def uau_product(id)
	$driver.goto ("#{$base_url}" + "#{id}")
	$driver.goto ("#{$base_url}" + "#{id}")
end


end