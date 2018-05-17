require "./lib/pages/timex/timex_customizer"

describe "Timex Customizer" do

	before(:all) do
		@page = TimexCustomizer.new
		
	end

	after(:all) do
	end

	context "UI Test" do

		it "Load Test" do
			case ENV['ENVIRONMENT'].to_sym
				when :test then @page.goto("http://madetoordertest.blob.core.windows.net/timex/frontend/index.html#/productset/tmx-prs-wrist-watches")
				when :staging then @page.goto("http://madetoorderstaging.blob.core.windows.net/timex/frontend/index.html#/productset/tmx-prs-wrist-watches")
				when :prod then @page.goto("http://dev05-us-timex.demandware.net/s/sequel/guess-original/GuessOriginal.html#/productset/tmx-prs-wrist-watches")
			end
			@page.wait_until {@page.loading_bar?}
			@page.wait_while {@page.loading_bar?}
			BasePage.performance_check
		end

		it "Iterate Case Tab" do
			@page.iterate_tab
		end

		it "Iterate Dial Tab" do
			@page.dial_tab_element.click
			@page.iterate_tab
		end

		it "Iterate Strap Tab" do
			@page.strap_tab_element.click
			@page.iterate_tab
		end

		it "Iterate Engraving Tab" do
			@page.engraving_tab_element.click
			@page.text_tab
		end

		it "Report Page Errors" do
			# BasePage.print_js_errors
			BasePage.print_js_warnings
			# BasePage.raise_js_errors
		end
	end
	
end