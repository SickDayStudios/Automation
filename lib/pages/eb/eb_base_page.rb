class EBBasePage < BasePage
	include PageObject

	span(:hood_label, css: "#addHood > li > h2 > span")
	h2(:hood_option, css: "button")




end