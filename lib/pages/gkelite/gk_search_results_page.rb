require './lib/helpers/gkelite/gk_search_filters'
require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_header'
require './lib/helpers/gkelite/gk_quick_view'

class GKSearchResultsPage < GKShopifyBasePage
	include PageObject
	include GKSearchFilters
	include GKHeader
	include GKQuickView


div(:filters, class: ["sidebar-filter__accordion-group"])
h1(:search_result_text, css: "#site-container > div.container > div.search__results > div:nth-child(1) > div > div > h1")
div(:four_oh_four, class: ["four-oh-four"])


# => Divs
link(:product_quick_view, css: "#site-container > div.container > div.search__results > div:nth-child(2) > div.col-sm-9.col-xs-12 > div:nth-child(1) > div > div:nth-child(1) > div:nth-child(4) > div.page-productlisting__content--hover > div.page-productlisting__fav-more > a")
div(:first_result, css: "#site-container > div.container > div.search__results > div:nth-child(2) > div.col-sm-9.col-xs-12 > div:nth-child(1) > div > div:nth-child(1) > div:nth-child(4)")
divs(:results, class: ["page-productlisting__bucket"])
divs(:hover_results, class: ["page-productlisting__content--hover"])
link(:quick_view_link, class: ["page-productlisting__quick-view"])

#product-listing-filters-container > div > div.sidebar-filter__accordion > div > div:nth-child(1) > div.accordion-content.active > ul > li:nth-child(2) > div > label > span
# => Checkboxes
checkbox(:in_stock, id: "type-0")
checkbox(:special_order, id: "type-1")
checkbox(:five_star, id: "rating-0")
checkbox(:four_star, id: "rating-1")
checkbox(:three_star, id: "rating-2")
checkbox(:two_star, id: "rating-3")
checkbox(:one_star, id: "rating-4")
checkbox(:no_star, id: "rating-5")
divs(:sizes, class: ["form-items togglebutton"])

# => Buttons
button(:view_more, class: "page-productlisting__view-more")

# => Input Fields
text_field(:price_min, class: ["sidebar-filter__price-range__value price-range-min"])
text_field(:price_max, class: ["sidebar-filter__price-range__value price-range-max"])

# => MISC
h1(:page_not_found, css: "#site-container > div.container > div > div.col-xs-12 > h1")

# => Quickview
div(:quickview_color, class: "color-picker")
div(:added_to_cart, id: "added-to-cart")


	def check_rating_filters
		ratings = ['check_five_star',
				   'check_four_star',
				   'check_three_star',
				   'check_two_star',
				   'check_one_star',
				   'check_no_star']
		ratings.each do |stars|
			self.send(stars)
		end
	end

	def uncheck_rating_filters
		ratings = ['uncheck_five_star',
				   'uncheck_four_star',
				   'uncheck_three_star',
				   'uncheck_two_star',
				   'uncheck_one_star',
				   'uncheck_no_star']
		ratings.each do |stars|
			self.send(stars)
		end
	end

	def quick_view
		self.first_result_element.hover
		self.product_quick_view_element.click
	end

	def random_result
		@arr = Array.new
		self.results_elements.link.each do |x| 
			@arr.push(x)
		end
		@arr.sample.click
	end

end