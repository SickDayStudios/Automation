require "./lib/pages/base_page"

class DemoBasePage < BasePage
	include PageObject

	text_field(:password, id: "passcode")
	button(:submit, text: "SUBMIT")
	divs(:accordions, class: ["label-wrapper"])
	divs(:swatches, class: ["swatch"])
	file_field(:upload, id: "upload")
	div(:background, id: "main")
	text_field(:text, id: "textFeatureString")
	select_list(:font, class: ["selection-select"])
	divs(:background_options, class: ["bg-swatch"])

	def enter_password
		self.password = "UNEEK_Spectrum_2018"
		self.submit
	end

	def iterate
		self.accordions_elements.each do |acc|
			acc.element.click
			if self.upload?
				self.upload = (File.dirname(__FILE__) + "/chicken.jpg")
				sleep 1
			end

			if self.text?
				self.text = "QA AUTOMATION"
				sleep 1
			end

			if self.font?
				self.font_options.each do |op|
					self.font = op
					sleep 1
				end
			end

			if self.swatches_elements.present?
				self.swatches_elements.each do |sw|
					if sw.element.visible?
						sw.element.click
						sleep 1
					end
				end
			end
		end
		self.background_options_elements.each do |bg|
			bg.element.click
			sleep 5
		end
	end
end