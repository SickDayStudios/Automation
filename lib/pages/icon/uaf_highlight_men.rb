class HighlightMenAPI < BasePage
	include PageObject

image(:icon_loading, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__loadscreen > img')

#Tab Accessors
div(:tab_upper, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(1)')
div(:tab_logos, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(2)')
div(:tab_logo_outline, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(3)')
div(:tab_heel, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(4)')
div(:tab_tongue, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(5)')
div(:tab_laces, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(6)')
div(:tab_outsole, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(7)')
div(:tab_lateral_text, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(8)')
div(:tab_medial_text, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(9)')
div(:tab_size, css: 'body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__controlpalette > div.customizer__controlpalette__navigation__frame > div.customizer__controlpalette__navigation > div > div:nth-child(10)')

#Logo Accessors
div(:logos_white, css: '#mCSB_1_container > div > div.color-swatch.first-swatch')
div(:logos_black, css:'#mCSB_1_container > div > div:nth-child(2)')
div(:logos_steel, css:'#mCSB_1_container > div > div:nth-child(3)')
div(:logos_cardinal, css:'#mCSB_1_container > div > div:nth-child(4)')
div(:logos_red, css:'#mCSB_1_container > div > div:nth-child(5)')
div(:logos_pink, css:'#mCSB_1_container > div > div:nth-child(6)')
div(:logos_orange, css:'#mCSB_1_container > div > div:nth-child(7)')
div(:logos_gold, css:'#mCSB_1_container > div > div:nth-child(8)')
div(:logos_kelly, css:'#mCSB_1_container > div > div:nth-child(9)')
div(:logos_forest, css:'#mCSB_1_container > div > div:nth-child(10)')
div(:logos_neptune, css:'#mCSB_1_container > div > div:nth-child(11)')
div(:logos_carolina, css:'#mCSB_1_container > div > div:nth-child(12)')
div(:logos_royal, css:'#mCSB_1_container > div > div:nth-child(13)')
div(:logos_navy, css:'#mCSB_1_container > div > div:nth-child(14)')
div(:logos_purple, css:'#mCSB_1_container > div > div:nth-child(15)')



#Logo Outline Accessors
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
div(:outline_kelly, css: '#mCSB_1_container > div > div:nth-child(11)')
div(:outline_neptune, css: '#mCSB_1_container > div > div:nth-child(12)')
div(:outline_forest, css: '#mCSB_1_container > div > div:nth-child(13)')
div(:outline_carolina, css: '#mCSB_1_container > div > div:nth-child(14)')
div(:outline_royal, css: '#mCSB_1_container > div > div:nth-child(15)')
div(:outline_navy, css: '#mCSB_1_container > div > div:nth-child(16)')
div(:outline_purple, css: '#mCSB_1_container > div > div:nth-child(17)')

#Left/Right Shoe Toggle
button(:change_foot, css: "body > div.content-wrapper > uaf-customizer > div > div > div > div.customizer__headupdisplay > div.customizer__headupdisplay__ui > div.ui.ui--stance.ui--stance--left > tooltip.tooltips._top._steady._multiline._ready > tip-cont > div > button")



url = 'https://api.spectrumcustomizer.com/api/productsets/uaf-prs-highlight-mens/'
uri = URI(url)
response = Net::HTTP.get(uri)
specs = JSON.parse(response)



$collar_left_color = {
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][8]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][8]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][8]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"]
}

$collar_right_color = {
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][8]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][8]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][8]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"]
}

$tongue_logo_left = {
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	:cardinal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][3]["thenDefaultSelection"]["handle"],
	:red => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	:pink => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][5]["thenDefaultSelection"]["handle"],
	:orange => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][6]["thenDefaultSelection"]["handle"],
	:gold => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][7]["thenDefaultSelection"]["handle"],
	:kelly => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][8]["thenDefaultSelection"]["handle"],
	:forest => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][9]["thenDefaultSelection"]["handle"],
	:neptune => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][10]["thenDefaultSelection"]["handle"],
	:carolina => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][11]["thenDefaultSelection"]["handle"],
	:royal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][12]["thenDefaultSelection"]["handle"],
	:navy => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][13]["thenDefaultSelection"]["handle"],
	:purple => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][14]["thenDefaultSelection"]["handle"]
#	:charcoal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
#	:aluminum => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],

}

$tongue_logo_right = {
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	:cardinal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][3]["thenDefaultSelection"]["handle"],
	:red => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	:pink => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][5]["thenDefaultSelection"]["handle"],
	:orange => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][6]["thenDefaultSelection"]["handle"],
	:gold => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][7]["thenDefaultSelection"]["handle"],
	:kelly => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][8]["thenDefaultSelection"]["handle"],
	:forest => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][9]["thenDefaultSelection"]["handle"],
	:neptune => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][10]["thenDefaultSelection"]["handle"],
	:carolina => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][11]["thenDefaultSelection"]["handle"],
	:royal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][12]["thenDefaultSelection"]["handle"],
	:navy => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][13]["thenDefaultSelection"]["handle"],
    :purple => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][14]["thenDefaultSelection"]["handle"]
	# :aluminum => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	# :charcoal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][9]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	
}

end