module GKCartLightbox
	include PageObject

link(:close, class: "close")
link(:continue_shopping, css: "#added-to-cart > footer > ul > li:nth-child(1) > a")
link(:checkout, css: "#added-to-cart > footer > ul > li:nth-child(2) > a")
end