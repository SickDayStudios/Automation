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
	
	div(:add_hood, css: "#addHood > li > h2") 
	h2(:jacket_options, class: ["selected"])
	span(:swatches, class: ["ng-scope selectionOption"])
	
	h2(:interior_label_option, css: "#feature-eb-fea-mens-sandstone-eb-fea-ms-custom-label-text > h2")
	text_field(:add_interior_label, name: "interior-label-text")
	h2(:chest_monogram_option, css: "#feature-eb-fea-mens-sandstone-eb-fea-ms-chest-monogram-text > h2")
	h2(:sleeve_monogram_option, css: "#feature-eb-fea-mens-sandstone-eb-fea-ms-sleeve-monogram-text > h2")
	text_field(:monogram_line_one, name: "monogram-text-line-one")
	text_field(:monogram_line_two, name: "monogram-text-line-two")
	h2(:size_option, css: "#chooseSize > li > h2")
	radio(:mens_tall_size, id: "size-selection-eb-fea-mm-tall-size")
	select_list(:size_dropdown, css: "#chooseSize > li > div > size-options > div.size-choice-column > div:nth-child(1) > select") 
	div(:add_to_bag, id: "total")



end