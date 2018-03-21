require "./lib/pages/demo/demo_base_page"

describe ".describe" do

	before(:all) do
		@page = DemoBasePage.new
	end

	context ".context.#{@page.class}" do
		it ".test" do
			@page.goto("http://www.spectrumcustomizer.com/lab/index.html#/")
			@page.enter_password
			@page.wait_until {@page.accordions_elements.present?}
			@page.wait_until {@page.background?}
			@page.iterate
		end
	end
end