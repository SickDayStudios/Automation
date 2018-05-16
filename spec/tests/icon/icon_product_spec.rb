require "./lib/pages/icon/icon_customizer_page"

describe "ICON | #{ENV['ENVIRONMENT']} | #{ENV['BROWSER']} | Packlist-Spec Test" do 

	before(:all) do
		@page = IconCustomizer.new
	end



	$icon_pid.each do |pid|
		it "iCON | #{pid}" do
			case ENV['ENVIRONMENT'].to_sym
			when :staging then url = "https://staging.underarmour.com/en-us/#{pid}"
			when :prod then url = "https://www.underarmour.com/en-us/#{pid}"
			end
			@page.goto(url)
			sleep 1
			@page.wait_until {@page.loading_bar_element.exists?}
			@page.wait_while(timeout: 60) {@page.loading_bar_element.visible?}
			@page.wait_until {@page.upper_options_elements.present?}
			@page.wait_until {@page.color_tabs_elements.present?}
			sleep 5
			@page.close_footer
			BasePage.performance_check
			aggregate_failures "#{pid}" do
				fe = @page.create_random_shoe
				sleep 5
				BasePage.raise_js_errors
				product_handle = IconBasePage.get_product_set_handle(fe[:id])
				recipe_set = IconBasePage.convert_handle_to_text(product_handle,fe[:id])
				spec = IconBasePage.parse_spec_html(fe[:id])
				packlist = IconBasePage.parse_icon_packlist(fe[:id])
				aggregate_failures "#{pid}" do
					expect(fe[:order]).to include(spec[0]["purchase order #"])
					expect(fe[:id]).to include(spec[0]["recipe set id"])
					expect(fe[:sku]).to include(spec[0]["sku"])
					expect(fe[:size]).to include(spec[0]["size"])
					expect(fe[:name]).to include(packlist["SENT TO"])
					expect(fe[:name]).to include(packlist["BOUGHT BY"])
					expect(fe[:order]).to include(packlist["ORDER #"])
					expect(fe[:sku]).to include(packlist["STYLE #"])
					expect(fe[:size]).to include(packlist["SIZE"])
					expect(fe[:price]).to include(packlist["ITEM PRICE"])
				end
				aggregate_failures "#{pid}" do
					fe[:recipe].each do |k,v|
						if v.nil? == false
							spec[2].each do |key,val|
								if key == k
									expect(val).to include(v)
								end
							end
						end
					end
				end
			end
			case ENV['ENVIRONMENT'].to_sym
			when :staging
				@page.goto("staging.spectrumcustomizer.com/under-armour/icon/specification/#{fe[:id]}/html")
				BasePage.raise_js_errors
				@page.goto("staging.spectrumcustomizer.com/under-armour/icon/packlist/#{fe[:id]}/html")
				BasePage.raise_js_errors
			when :prod
				@page.goto("api.spectrumcustomizer.com/under-armour/icon/specification/#{fe[:id]}/html")
				BasePage.raise_js_errors
				@page.goto("api.spectrumcustomizer.com/under-armour/icon/packlist/#{fe[:id]}/html")
				BasePage.raise_js_errors
			end
		end
	end
end