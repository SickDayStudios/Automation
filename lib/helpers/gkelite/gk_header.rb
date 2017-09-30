require 'page-object'

module GKHeader
	include PageObject



div(:gk_header_dropdown, 		class: "site-header__secondary-nav__item site-header-has-dropdown site-header__gk")
link(:gk_gymnastics,    		css: "#site-container > div.header-wrapper > header.site-header.primary > nav > div > div > div:nth-child(1) > div.site-header__secondary-nav__item.site-header-has-dropdown.site-header__gk.show-drop-nav > ul > li:nth-child(1) > a")
link(:gk_cheer,                 href: "http://www.gkelite.com/Cheer")


div(:ua_header_dropdown,        class: "site-header__secondary-nav__item site-header-has-dropdown site-header__ua show-drop-nav")
link(:ua_gymnastics,            href: "/pages/home-under-armour-gym")
link(:ua_cheer,                 href: "http://www.gkelite.com/UnderArmour")


link(:dolphin,                  href: "http://dolfinswimwear.com/")


div(:help_dropdown,             class: "site-header__secondary-nav__item site-header-has-dropdown site-header__help")
link(:size_charts,              href: "/pages/gk-gym-size-chart")
link(:care_instructions,        href: "/pages/gk-gym-care-instructions")
link(:shipping_delivery,        href: "/pages/gk-gym-shipping-delivery")
link(:cancel_return_order,      href: "/pages/gk-gym-orders-cancellation-returns")
link(:help_faq,              	href: "/pages/gk-gym-help-center-faqs")
link(:estimated_shipping,       href: "/pages/gk-gym-estimated-ship-week")
link(:contact_us,               href: "/pages/gk-gym-contact-us")


link(:login,                    css: "#site-container > div.header-wrapper > header.site-header.primary > nav > div > div > div:nth-child(2) > div.site-header__secondary-nav__item.site-header__login > a:nth-child(1)")
link(:register,					css:  "#site-container > div.header-wrapper > header.site-header.primary > nav > div > div > div:nth-child(2) > div.site-header__secondary-nav__item.site-header__login > a:nth-child(2)")
link(:cart,                     href: "/cart")


link(:logo_home,                href: "/")
link(:gk_women,                 href: "/pages/gk-gym-women")
link(:gk_men,					href: "/pages/gk-gym-men")
link(:gk_kids,                  href: "/pages/gk-gym-kids")
link(:gk_explore,               href: "/pages/explore-gk ")
link(:gk_fit,              	    href: "/pages/gk-gym-the-gk-fit")
link(:gk_history,               href: "/pages/gk-gym-our-history")
link(:gk_athletes,              href: "/pages/gk-gym-athletes")
link(:gk_events,                href: "/pages/gk-gym-events")
link(:gk_blog,              	href: "http://blog.gkelite.com/")
link(:gk_videos,               	href: "/pages/gk-gym-videos")
link(:gk_custom_options,        href: "/pages/gk-gym-custom-options")
link(:gk_sublimation_faq,       href: "/pages/gk-gym-what-is-sublimation")
link(:gk_news,               	href: "/pages/gk-gym-news")

text_field(:search_field,       css: "#site-container > div.global-nav.global-nav--gk-gym > nav > div > div.row > div > div > form > input")
button(:search_button,          name: "search-btn")
div(:search_dropdown, 			class: "snize-ac-results")

	def header_register
		self.register
		return GKLoginPage.new
	end

	def header_signin
		self.login
		return GKLoginPage.new
	end


	def search_for(item)
		self.search_field = item
		self.search_field_element.send_keys :return
		return GKSearchResultsPage.new
	end


end