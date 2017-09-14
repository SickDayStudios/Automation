require 'page-object'
require './lib/pages/base_page'
require './lib/helpers/gkelite/gk_header'
require './lib/helpers/gkelite/gk_footer'
require 'json'
require 'net/http'

class GKShopifyBasePage < BasePage
	include PageObject
	include GKHeader
	include GKFooter


text_field(:password, id: "password")
button(:enter, name: "commit")

	def enter_password
		self.password = "iawhao"
		self.enter
	end


	def login_page
		$driver.goto $base_url + "/account/login"
		return GKLoginPage.new
	end

	def cart_page
		$driver.goto $base_url + "/cart"
		return GKCartPage.new
	end

	def search_page
		$driver.goto $base_url + "/pages/search-results-page?q="
		return GKSearchPage.new
	end

	def product_page(id)
		$driver.goto $base_url + "/products/#{id}"
		return GKProductPage.new
	end

	def home_page
		$driver.goto $base_url
		return GKHomePage.new
	end

	def collections(id)
		$driver.goto $base_url + "/collections/#{id}?view=product"
	end

	def api_setup(url)
		uri = URI(url)
		response = Net::HTTP.get(uri)
		specs = JSON.parse(response)
	end

end