require './lib/helpers/eb/eb_products'

class EBBasePage < BasePage
	include PageObject
	include EBProducts

	span(:hood_label, text: "HOOD")
	span(:body_label, text: "Body")
	span(:sleeves_shoulder_hood_label, text: "Sleeves & Collar/Hood")
	span(:shoulder_collar_hood_label, text: "Shoulder & Collar/Hood")
	span(:sleeves_label, text: "Sleeves")
	span(:stretch_panel_label, text: "Stretch Panels")
	span(:side_panels_label, text: "Side Panels")
	span(:thread_label, text: "Thread")
	span(:zipper_label, text: "Main Zipper")
	span(:pocket_zipper_label, text: "Pocket Zippers")
	span(:zipper_pull_label, text: "Zipper Pulls")
	span(:logos_label, text: "Logos and Monograms")
	span(:interior_label, text: "Interior Label")
	span(:chest_monogram_label, text: "Add Chest Monogram")
	span(:sleeve_monogram_label, text: "Add Sleeve Monogram")
	span(:size_label, text: "Size")
	h2(:open_options, class: ["selected"])
	h3(:swatches, class: ["color-label"])



end