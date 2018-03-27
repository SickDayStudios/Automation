require "./lib/pages/demo/demo_base_page"

describe "DEMO | describe" do

	before(:all) do
		@page = DemoBasePage.new
	end

	# context "KEEN.context" do
	# 	it "UNEEK.test" do
	# 		@page.goto("http://www.spectrumcustomizer.com/lab/index.html#/")
	# 		@page.enter_password
	# 		@page.wait_until {@page.accordions_elements.present?}
	# 		@page.wait_until {@page.background?}
	# 		@page.iterate
	# 	end
	# end

	context "UA | context" do
		it "UASM | test" do
			@page.goto("https://madetoordertest.blob.core.windows.net/spectrum/demo/index.html#/")
			@page.wait_until { @page.password? }
			@page.password = "UASM_Spectrum_PDP"
			@page.submit
			@page.wait_until {@page.accordions_elements.present?}
			@page.wait_until {@page.background?}
			sleep 2
			@page.iterate
		end
	end
end