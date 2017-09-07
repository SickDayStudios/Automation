require 'json'
require 'net/http'

class CurryMenAPI


url = 'https://api.spectrumcustomizer.com/api/productsets/uaf-prs-curry1-mens/'
uri = URI(url)
response = Net::HTTP.get(uri)
specs = JSON.parse(response)


$midsole_left_color = {
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:midnight => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:red => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"],
	:taxi => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][5]["thenSelectionGroup"]["selections"][0]["handle"],
	:royal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][6]["thenSelectionGroup"]["selections"][0]["handle"],
	:gold => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][7]["thenSelectionGroup"]["selections"][0]["handle"],
	:silver => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][8]["thenSelectionGroup"]["selections"][0]["handle"],
	:fire => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][9]["thenSelectionGroup"]["selections"][0]["handle"],
	:neptune => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][10]["thenSelectionGroup"]["selections"][0]["handle"]
	}

$midsole_right_color = {
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:midnight => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:red => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"],
	:taxi => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][5]["thenSelectionGroup"]["selections"][0]["handle"],
	:royal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][6]["thenSelectionGroup"]["selections"][0]["handle"],
	:gold => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][7]["thenSelectionGroup"]["selections"][0]["handle"],
	:silver => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][8]["thenSelectionGroup"]["selections"][0]["handle"],
	:fire => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][9]["thenSelectionGroup"]["selections"][0]["handle"],
	:neptune => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][13]["featureSelectionGroups"][10]["thenSelectionGroup"]["selections"][0]["handle"]
	}


$outsole_left_color = {
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:blue => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:gum => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"]
	}

$outsole_right_color = {
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:blue => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:gum => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][14]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"]
	}

$line_left_color = {
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:blue => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:gum => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"]
	}

$line_right_color = {
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:blue => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:gum => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][15]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"]
	}

$eyelet_left_color = {
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	:midnight => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][3]["thenDefaultSelection"]["handle"],
	:royal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	:taxi => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][5]["thenDefaultSelection"]["handle"],
	:red => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][6]["thenDefaultSelection"]["handle"],
	:blue => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][7]["thenDefaultSelection"]["handle"],
	:neptune => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][8]["thenDefaultSelection"]["handle"],
	:maroon => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][9]["thenDefaultSelection"]["handle"],
	:orange => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][10]["thenDefaultSelection"]["handle"],
	:purple => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][11]["thenDefaultSelection"]["handle"],
	:fire => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][12]["thenDefaultSelection"]["handle"],
	:cardinal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][13]["thenDefaultSelection"]["handle"]
	}

$eyelet_right_color = {
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	:midnight => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][3]["thenDefaultSelection"]["handle"],
	:royal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	:taxi => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][5]["thenDefaultSelection"]["handle"],
	:red => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][6]["thenDefaultSelection"]["handle"],
	:blue => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][7]["thenDefaultSelection"]["handle"],
	:neptune => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][8]["thenDefaultSelection"]["handle"],
	:maroon => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][9]["thenDefaultSelection"]["handle"],
	:orange => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][10]["thenDefaultSelection"]["handle"],
	:purple => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][11]["thenDefaultSelection"]["handle"],
	:fire => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][12]["thenDefaultSelection"]["handle"],
	:cardinal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][10]["featureSelectionGroups"][13]["thenDefaultSelection"]["handle"]
	}

$loop_left_color = {
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	:midnight => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][3]["thenDefaultSelection"]["handle"],
	:royal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	:red => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][5]["thenDefaultSelection"]["handle"],
	:cardinal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][6]["thenDefaultSelection"]["handle"],
	:taxi => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][7]["thenDefaultSelection"]["handle"],
	:green => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][8]["thenDefaultSelection"]["handle"],
	:blue => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][9]["thenDefaultSelection"]["handle"]
}

$loop_right_color = {
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][0]["thenDefaultSelection"]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][1]["thenDefaultSelection"]["handle"],
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][2]["thenDefaultSelection"]["handle"],
	:midnight => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][3]["thenDefaultSelection"]["handle"],
	:royal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][4]["thenDefaultSelection"]["handle"],
	:red => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][5]["thenDefaultSelection"]["handle"],
	:cardinal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][6]["thenDefaultSelection"]["handle"],
	:taxi => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][7]["thenDefaultSelection"]["handle"],
	:green => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][8]["thenDefaultSelection"]["handle"],
	:blue => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][18]["featureSelectionGroups"][9]["thenDefaultSelection"]["handle"]
}

$sc_left_color = {
	:white => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:black => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:midnight => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:royal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:taxi => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"],
	:red => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][5]["thenSelectionGroup"]["selections"][0]["handle"],
	:silver => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][6]["thenSelectionGroup"]["selections"][0]["handle"],
	:gold => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][7]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][8]["thenSelectionGroup"]["selections"][0]["handle"],
	:cardinal => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][9]["thenSelectionGroup"]["selections"][0]["handle"],
	:fire => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][10]["thenSelectionGroup"]["selections"][0]["handle"],
	:orange => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][11]["thenSelectionGroup"]["selections"][0]["handle"],
	:neptune => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][12]["thenSelectionGroup"]["selections"][0]["handle"],
	:blue => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][13]["thenSelectionGroup"]["selections"][0]["handle"],
	:purple => specs["contents"]["productGroups"][0]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][14]["thenSelectionGroup"]["selections"][0]["handle"]
}

$sc_right_color = {
	:white => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][0]["thenSelectionGroup"]["selections"][0]["handle"],
	:black => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][1]["thenSelectionGroup"]["selections"][0]["handle"],
	:midnight => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][2]["thenSelectionGroup"]["selections"][0]["handle"],
	:royal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][3]["thenSelectionGroup"]["selections"][0]["handle"],
	:taxi => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][4]["thenSelectionGroup"]["selections"][0]["handle"],
	:red => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][5]["thenSelectionGroup"]["selections"][0]["handle"],
	:silver => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][6]["thenSelectionGroup"]["selections"][0]["handle"],
	:gold => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][7]["thenSelectionGroup"]["selections"][0]["handle"],
	:steel => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][8]["thenSelectionGroup"]["selections"][0]["handle"],
	:cardinal => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][9]["thenSelectionGroup"]["selections"][0]["handle"],
	:fire => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][10]["thenSelectionGroup"]["selections"][0]["handle"],
	:orange => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][11]["thenSelectionGroup"]["selections"][0]["handle"],
	:neptune => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][12]["thenSelectionGroup"]["selections"][0]["handle"],
	:blue => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][13]["thenSelectionGroup"]["selections"][0]["handle"],
	:purple => specs["contents"]["productGroups"][1]["products"][0]["rootFeature"]["childFeatures"][12]["featureSelectionGroups"][14]["thenSelectionGroup"]["selections"][0]["handle"]
}


end