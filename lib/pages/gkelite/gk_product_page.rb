require './lib/pages/gkelite/gk_shopify_base_page'
require './lib/helpers/gkelite/gk_header'

require './lib/helpers/gkelite/gk_cart_lightbox'
require './lib/helpers/gkelite/gk_search_filters'

class GKProductPage < GKShopifyBasePage
	include PageObject
	include GKHeader
	include GKCartLightbox
	include GKSearchFilters



	##=> TODO
	element(:body, tag_name: "body")
	nav(:breadcrumb, class: ["module-breadcrumb"])
	span(:style_id, css: "#product-attributes-container > div > h1 > span")
	div(:overlay, css: "#basic-boat-neck-comp-leotard > div:nth-child(17)")
	select_list(:user_dropdown, name: "product-type")
	link(:review_design, class: ["product-meta__review-design-link"])
	button(:save_design, text: "Save Design")
	div(:product_container, class: ["product-attributes-container"])

	# Style Name
	div(:product_info, id: "product-attributes-container")
	span(:price, class: ["product-meta__price"])
	p(:selected_color, class: ["product-color"])
	div(:color_picker, class: ["color-picker"])
	div(:color_chooser, class: "product__color-chooser")
	div(:size_dropdown, class: "size-selector")
	div(:child_size_options, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(2)")
	div(:adult_size_options, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(3)")
	button(:size_cs, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(2) > button:nth-child(1)")
	button(:size_cxs, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(2) > button:nth-child(2)")
	button(:size_cm, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(2) > button:nth-child(3)")
	button(:size_cl, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(2) > button:nth-child(4)")
	button(:size_as, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(4) > button:nth-child(1)")
	button(:size_axs, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(4) > button:nth-child(2)")
	button(:size_al, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(4) > button:nth-child(3)")
	button(:size_axl, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(4) > button:nth-child(4)")
	button(:size_am, css: "#product-attributes-container > form > div.size-selector.open > div > div:nth-child(4) > button:nth-child(5)")
	div(:product_thumbnails, id: "product-thumbnails-container")
	image(:product_image, id: "img-0")
	image(:placeholder_image, src: /\w+[a-z]\w-gk.jpg/)
	div(:four_oh_four, class: ["four-oh-four"])


	# Fit & Size
	div(:fit_size_info, class: ["fit-size"])
	link(:sizing_chart, class: ["size-chart lightbox-trigger"])
	div(:size_lightbox, id: "sizing-chart")
	image(:size_close, css: "#sizing-chart > div.close > img")
	span(:selected_size, css: "#product-attributes-container > form > div.size-selector > label > span")
	div(:consumer_quantity, class: ["quantity-list-container"])
	text_field(:dealer_quantity, name: "cxs")
	button(:q_one, css: "#product-attributes-container > form > div.product-quantity-wrapper > div > button:nth-child(1)")
	button(:q_two, css: "#product-attributes-container > form > div.product-quantity-wrapper > div > button:nth-child(2)")
	button(:q_three, css: "#product-attributes-container > form > div.product-quantity-wrapper > div > button:nth-child(3)")
	button(:q_four, css: "#product-attributes-container > form > div.product-quantity-wrapper > div > button:nth-child(4)")
	button(:q_five, class: ["final"])
	text_field(:q_manual, class: ["input"])
	button(:add_to_cart, id: "AddToCart")
	link(:customize_button, class: ["addtocart-customize__buttons--customize"])
	link(:customize, css: "#product-attributes-container > form > div.addtocart-customize > div > div:nth-child(2) > a")

	# Accordions
	div(:product_accordions, class: ["product-accordion"])
	div(:fabric_care, css: "#accordion > section:nth-child(2) > div:nth-child(1)")
	link(:show_more, id: "product-fabric-care-show-more")
	div(:fabric_care_modal, id: "product-fabric-care-modal")
	div(:care_close, css: "#product-fabric-care-modal > div")
	div(:product_details, css: "#accordion > section.open > div:nth-child(2)")
	div(:review, css: "#accordion > section:nth-child(3) > div:nth-child(1)")
	link(:write_cancel_review, class: ["jdgm-write-rev-link"])
	div(:review_header, class: ["jdgm-rev-widg__header"])
	div(:review_body, class: ["jdgm-rev-widg__body"])
	text_field(:review_name, name: "reviewer_name")
	text_field(:review_email, name: "reviewer_email")
	links(:star_rating, class: ["jdgm-star jdgm--on"])
	text_field(:review_title, name: "review_title")
	text_area(:review_body, name: "review_body")
	button(:submit_review, class: ["jdgm-submit-rev btn btn_c button"])
	div(:review_confirm, class: ["jdgm-notification"])
	label(:errors, id: "reviewer_name-error")
	div(:error_message, class: "error-message")

	# You May Also Like
	div(:similar_recent_products, id: "product-carousel-container")
	div(:arrow_previous, class: ["swiper-button-prev swiper-button-black"])
	div(:arrow_next, class: ["swiper-button-next swiper-button-black"])
	divs(:suggested_garments, class: ["swiper-slide"])

	# 2D
	element(:blob_not_found, css: "#customizer-2d-container > div:nth-child(1) > div.col-md-6.svg-viewer-container > error > code")
	button(:next_button, text: "Next")
	button(:saving_design, text: "Saving Design...")
	p(:oops, css: "#customizer-2d-container > div:nth-child(2) > div.col-md-6.save-design > p:nth-child(4)")


	# Lightbox
	div(:cart_popup, id: "added-to-cart")






	

	def check_ao
		puts " ID  | RecipeID | Spec ID  | Expected A0#  | Spec A0#"
		
		$gk_products.each do |id|
			$driver.goto "gkelite.com/products/#{id}"

			if self.four_oh_four?
				puts "#{id} | 404 Product Page Missing"
			else
				self.wait_until { self.color_picker_element.exists? }
				self.wait_until { self.color_picker_element.present? }
				self.wait_until { self.color_picker_element.visible? }
				recipe_set_ids = self.get_recipe_ids
				ao_numbers = self.get_ao_numbers

				if recipe_set_ids.empty?
					puts "#{id} | #{ao_numbers} | Missing Recipe Set ID"
				else
					recipe_set_ids.zip(ao_numbers).each do |rset,ao|

						if rset == id
							puts "#{id} | #{ao} | #{rset}"
						else
							@recipe = JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/recipesets/readable/#{rset}"))
							
							if @recipe["contents"].nil?
								puts "#{id} | #{rset} | Broken Recipe"
							else
								@recipe["contents"]["recipes"].each do |indx|
									
									if indx["productHandle"].include?("#{id}")
										@spec_id = indx["recipe"]["readableId"]
									end
								end
								@spec = JSON.parse(RestClient.get("http://api.spectrumcustomizer.com/api/external/gk-elite/specification/#{@spec_id}"))
								
								if ao != @spec["A0Number"]
									puts "#{id} | #{rset} | #{@spec_id} | Expected: #{ao} | Got: #{@spec["A0Number"]}"
								end
							end
						end	
					end
				end

			end

		end
	end

	def color_buttons
		@id_array = Array.new
		colors = self.color_picker_element.buttons
		colors.each do |ao|
			ao.click
			@id_array.push(self.customize_button_element.href)
		end
		@id_array.flatten
	end

	def get_ao_numbers
		@ao_array = Array.new
		colors = self.color_picker_element.buttons
		colors.each do |ao|
			ao.click
			@ao_array.push(self.selected_color_element.text.scan(/(?=\w*[0-9])\w*/))
		end
		@ao_array.flatten
	end


	def get_recipe_ids
		@id_array = Array.new
		colors = self.color_picker_element.buttons
		colors.each do |ao|
			ao.click
			@id_array.push(self.customize_button_element.href.scan(/\w+[A-Z]\w+/))
		end
		@id_array.flatten
	end

	def add_product_checkout
		self.wait_while { $base_url == self.url }
		self.wait_until { self.url.include?('/products/3728') }
		self.wait_until { self.product_thumbnails? }
		self.random_size
		self.consumer_random_quantity
		self.add_to_cart
		self.wait_until { self.cart_popup? }
		self.checkout
		self.wait_until { self.url.include?('cart') }
	end

	def get_product_data(id)
		return JSON.parse(RestClient.get("https://#{ENV['ENVIRONMENT']}-gkelite.pollinate.com/collections/#{id}/?view=product"))
	end


	def selected_color
		self.wait_until { self.product_thumbnails? }
		self.color_picker_element.buttons.to_a
	end

	def random_options
		if ENV['USER_TYPE'] == "consumer"
			self.wait_until { self.size_dropdown? }
			self.random_size
			self.wait_until { self.consumer_quantity? }
			self.consumer_random_quantity
		else
			self.wait_until { self.dealer_quantity? }
			self.dealer_quantity = "5"
		end
	end

	def consumer_random_quantity
		@arr = Array.new
		self.consumer_quantity_element.button.click
		self.consumer_quantity_element.buttons.each do |x|
			@arr.push(x)
		end
		@arr.sample.click
	end

		# def dealer_random_quantity
		# 	@arr = Array.new
		# 	self.dealer_quantity_elements.text_field.each do |x|
		# 		@arr.push(x)
		# 	end
		# 	@arr.sample.send_keys rand[1..5].to_s
		# end

		def random_size
			@arr = Array.new
			self.size_dropdown_element.click
			self.wait_until { self.child_size_options? }
			if self.child_size_options?
				self.child_size_options_element.buttons.each do |x|
					@arr.push(x)
				end
			end
			if self.adult_size_options?
				self.adult_size_options_element.buttons.each do |x|
					@arr.push(x)
				end
			end
			@arr.sample.click
		end

		def random_stars
			@arr = Array.new
			self.star_rating_elements.each do |x|
				@arr.push(x)
			end
			@arr.sample.click
		end


		def fill_review
			self.review_name = 'Tester'
			self.review_email = 'test@qa.com'
			self.random_stars
			self.review_title = 'This is a test'
			self.review_body = 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST'
		end

	end