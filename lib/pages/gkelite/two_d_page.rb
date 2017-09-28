require 'page-object'
require './lib/pages/gkelite/gk_shopify_base_page'
require 'json'
require 'net/http'

class StockCustomizer < GKShopifyBasePage
	include PageObject

div(:page_load, id: "site-wrapper")
div(:svg_viewer, class: ["svg-viewer-container"])

def missing_blob
	$driver.element(:tag_name, "code")
end

def svg
	$driver.element(:tag_name, "svg")
end

def back_side
	$driver.element(id: /^Back/)
end

def front_side
	$driver.element(id: /^Front/)
end

def silhouette
	$driver.element(id: 'Silhouette')
end


def get_color_code(name, id)
	url = "https://staging-gkelite.pollinate.com/collections/#{id}?view=product"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	specs = JSON.parse(response)
	return specs["colors"]["#{name}"]["erp_color_code"]
end


def get_data(id)
	@arr = Array.new
	url = "https://staging-gkelite.pollinate.com/collections/#{id}?view=product"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	specs = JSON.parse(response)
	specs["colors"].each_key do |x|
		@arr.push(specs["colors"]["#{x}"]["erp_color_code"])
	end
	return @arr
end

def get_back_color_ids
	@arr = Array.new
	self.back_side.elements(:tag_name, "g").each do |x|
		@arr.push(x.id)
	end
	return @arr.reject(&:empty?)
end

def get_front_color_ids
	@arr = Array.new
	self.front_side.elements(:tag_name, "g").each do |x|
		@arr.push(x.id)
	end
	return @arr.reject(&:empty?)
end

end