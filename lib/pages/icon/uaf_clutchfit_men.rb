require 'json'
require 'net/http'
require 'page-object'
require './lib/pages/base_page'

class ClutchfitMenAPI < BasePage
	include PageObject

div(:tab_upper_logo, css: "body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(2)")
div(:tab_logo_outline, css: "body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(3)")
button(:change_foot, class: "ui--stance__shoe ui--stance__shoe--left")

#logo swatches
div(:logos_white, css: '#mCSB_1_container > div > div.color-swatch.first-swatch')
div(:logos_black, css:'#mCSB_1_container > div > div:nth-child(2)')
div(:logos_steel, css:'#mCSB_1_container > div > div:nth-child(3)')
div(:logos_cardinal, css:'#mCSB_1_container > div > div:nth-child(4)')
div(:logos_red, css:'#mCSB_1_container > div > div:nth-child(5)')
div(:logos_pink, css:'#mCSB_1_container > div > div:nth-child(6)')
div(:logos_orange, css:'#mCSB_1_container > div > div:nth-child(7)')
div(:logos_gold, css:'#mCSB_1_container > div > div:nth-child(8)')
div(:logos_green, css:'#mCSB_1_container > div > div:nth-child(9)')
div(:logos_forest, css:'#mCSB_1_container > div > div:nth-child(10)')
div(:logos_neptune, css:'#mCSB_1_container > div > div:nth-child(11)')
div(:logos_carolina, css:'#mCSB_1_container > div > div:nth-child(12)')
div(:logos_royal, css:'#mCSB_1_container > div > div:nth-child(13)')
div(:logos_navy, css:'#mCSB_1_container > div > div:nth-child(14)')
div(:logos_purple, css:'#mCSB_1_container > div > div:nth-child(15)')



#Logo Outline swatches
div(:outline_white, css: '#mCSB_1_container > div > div.color-swatch.first-swatch')
div(:outline_black, css: '#mCSB_1_container > div > div:nth-child(2)')
div(:outline_aluminum, css: '#mCSB_1_container > div > div:nth-child(3)')
div(:outline_steel, css: '#mCSB_1_container > div > div:nth-child(4)')
div(:outline_charcoal, css: '#mCSB_1_container > div > div:nth-child(5)')
div(:outline_cardinal, css: '#mCSB_1_container > div > div:nth-child(6)')
div(:outline_red, css: '#mCSB_1_container > div > div:nth-child(7)')
div(:outline_pink, css: '#mCSB_1_container > div > div:nth-child(8)')
div(:outline_orange, css: '#mCSB_1_container > div > div:nth-child(9)')
div(:outline_gold, css: '#mCSB_1_container > div > div:nth-child(10)')
div(:outline_green, css: '#mCSB_1_container > div > div:nth-child(11)')
div(:outline_forest, css: '#mCSB_1_container > div > div:nth-child(12)')
div(:outline_neptune, css: '#mCSB_1_container > div > div:nth-child(13)')
div(:outline_carolina, css: '#mCSB_1_container > div > div:nth-child(14)')
div(:outline_royal, css: '#mCSB_1_container > div > div:nth-child(15)')
div(:outline_navy, css: '#mCSB_1_container > div > div:nth-child(16)')
div(:outline_purple, css: '#mCSB_1_container > div > div:nth-child(17)')



url = 'https://api.spectrumcustomizer.com/api/productsets/uaf-prs-clutchfit-mens/'
uri = URI(url)
response = Net::HTTP.get(uri)
specs = JSON.parse(response)


$bottom_logo_left = {
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"]
}

$bottom_logo_right = {
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"]
}

end