require './lib/helpers/eb/eb_products'

class EBBasePage < BasePage
	include PageObject
	include EBProducts

#=> accordian labels
	span(:hood_label, css: "#addHood > li > h2 > span")
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
	span(:interior_lining_label, text: "Interior Lining")
	span(:interior_label, text: "Interior Label")
	span(:chest_monogram_label, text: "Add Chest Monogram")
	span(:sleeve_monogram_label, text: "Add Sleeve Monogram")
	span(:size_label, text: "Size")
	elements(:color, tag_name: "swatch")
	div(:page_load, class: "loading-screen")
	div(:close_popup, class: ["md-close show"])

	
#=> clickable
	div(:add_hood, css: "#addHood > li > h2") 
	h2s(:jacket_options, class: ["selected"])
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
	radio(:size_regular, css: "#chooseSize > li > div > size-options > div.size-type-column > div > radio:nth-child(1)")
	radio(:size_tall, css: "#chooseSize > li > div > size-options > div.size-type-column > div > radio:nth-child(2)")
	radio(:size_petite, css: "#chooseSize > li > div > size-options > div.size-type-column > div > radio:nth-child(3)")
	div(:add_to_bag, id: "total")
	span(:price, id: "price")
	div(:cart_popup, id: "modalContent")

	p(:body, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(3)")
	p(:collar_hood, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(4)")
	p(:sleeves, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(5)")
	p(:stretch_panel, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(6)")
	p(:main_zipper, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(7)")
	p(:pocket_zipper, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(8)")
	p(:zipper_pull, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(9)")
	p(:logos, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(10)")
	p(:lining, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(11)")
	p(:label, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(12)")
	p(:monogram_one, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(13)")
	p(:monogram_two, css: "#modalContent > div > div > div.left.col-2.clearfix.pdp-atc-details > div:nth-child(5) > p:nth-child(14)")



end