require './lib/pages/base_page'
require './lib/helpers/uau/uau_garments'
require 'page-object'

class UAUBasePage < BasePage
	include UAUGarments
	include PageObject

	element(:page_load, tag_name: "modal", class: ["main-modal-container ng-scope ng-isolate-scope"])
	element(:loader, tag_name: "uau-loader", class: "loaded")
	div(:product_image, class: ["product__image"])
	button(:save, class: "save")
	text_field(:name_design, name: "name-design")
	button(:submit, text: "SUBMIT")
	button(:select_product, text: "Select")
	button(:color_modal_done, text: "Done")
	button(:color_modal_skip, text: "Skip")
	image(:color_modal_close, class: ["close ng-scope"])
	h1(:save_complete, class: "ng-binding")

	def uau_product(id)
		$driver.goto ("#{$base_url}#{id}")
		$driver.goto ("#{$base_url}#{id}")
	end

	def get_page_errors
		begin self.wait_until(10) { self.product_image? }
			if self.product_image?
				self.product_image_element.click
			end
		rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
			false
		end
		self.wait_until(60) { self.loader? }
		self.wait_while { self.loader_element.visible? }
		self.wait_while { self.page_load_element.exists? }
		begin self.wait_until(10) { self.color_modal_skip? }
			if self.color_modal_skip?
				self.color_modal_skip
			end
		rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
			false
		end
		self.wait_until { self.save_element.visible? }
		self.save
		self.name_design = "test"
		self.submit
		sleep 5
		BasePage.print_js_errors
	end
end