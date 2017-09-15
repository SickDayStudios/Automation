require './lib/pages/base_page'
require './lib/helpers/uau/uau_garments'
require 'page-object'

class UAUBasePage < BasePage
	include UAUGarments
	include PageObject

element(:loader, tag_name: "uau-loader", class: "loaded")

def uau_product(id)
	$driver.goto ("#{$base_url}" + "#{id}")
	$driver.goto ("#{$base_url}" + "#{id}")
end


end