require 'page-object'
require './lib/helpers/gkelite/gk_search_filters'
require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_header'
require './lib/helpers/gkelite/gk_quick_view'

class GKSearchResultsPage < GKShopifyBasePage
	include PageObject
	include GKSearchFilters
	include GKHeader
	include GKQuickView


link(:quick_view, class: "page-productlisting__quick-view lightbox-trigger")
div(:filters, class: "sidebar-filter__accordion-group")
div(:four_oh_four, class: /four-oh-four/)


end