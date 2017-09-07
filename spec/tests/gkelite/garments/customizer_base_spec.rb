require './lib/pages/gkelite/customizer_page'

describe "< Customizer Page Navigation Test >" do

  before(:all) do 
    @page = CustomizerPage.new
    @page.majesticmonarch
  end

  context 'Customizer Breadcrumb Navigation:' do

  	it '- Breadcrumbs: Disabled' do
  		@page.wait_until { @page.page_load? }
  		expect(@page.disabled_breadcrumb_embellishments?).to eq(true)
  		expect(@page.disabled_breadcrumb_additional_options?).to eq(true)
  		expect(@page.disabled_breadcrumb_sizes_alterations?).to eq(true)
  	end

  	it '- Button Redirect - Next: Embellishments' do
	  	@page.embellishments_button_element.click
	  	expect(@page.error_tooltip?).to eq(true)
	  end

	  it '- Disclaimer: Agree' do
	  	@page.disclaimer_checkbox_element.focus
	  	@page.disclaimer_checkbox_element.set(true)
	  	expect(@page.disclaimer_checkbox_element.set?).to eq(true)
	  end 

	  it '- Breadcrumbs: Enabled' do
	  	expect(@page.breadcrumb_embellishments_element.enabled?).to eq(true)
  		expect(@page.breadcrumb_additional_options_element.enabled?).to eq(true)
  		expect(@page.breadcrumb_sizes_alterations_element.enabled?).to eq(true)
	  end

	  it '- Breadcrumb: Embellishment' do
	  	@page.breadcrumb_embellishments_element.click
	  	expect(@page.url).to include('/embellishments')
	  end

	  it '- Breadcrumb: Additional Options' do
	  	@page.breadcrumb_additional_options_element.click
	  	expect(@page.url).to include('/additional-options')
	  end

	  it '- Breadcrumb: Sizes & Alterations' do
	  	@page.breadcrumb_sizes_alterations_element.click
	  	expect(@page.url).to include('/sizes-and-alterations')
	  end

	  it '- Breadcrumb: Design & Color' do
	  	@page.popup_cancel_button_element.click
	  	@page.breadcrumb_design
	  	expect(@page.url).to include('/design')
	  end

	end


	context 'Customizer Button Navigation:' do

	  it '- Button Redirect - Next: Embellishments' do
	  	@page.embellishments_button_element.click
	  	expect(@page.url).to include('/embellishments')
	  end

	  it '- Button Redirect - Back: Design & Color' do
	  	@page.design_color_button_element.click
	  	expect(@page.url).to include('/design')
	  end

	  it '- Button Redirect - Next: Additional Options' do
	  	@page.embellishments_button_element.click
	  	@page.additional_options_button_element.click
	  	expect(@page.url).to include('/additional-options')
	  end

	  it '- Button Redirect - Back: Embellishments' do
	  	@page.embellishments_button_element.click
	  	expect(@page.url).to include('/embellishments')
	  end

	  it '- Button Redirect - Next: Sizes & Alterations' do
	  	@page.additional_options_button_element.click
	  	@page.size_alterations_button_element.click
	  	expect(@page.url).to include('/sizes-and-alterations')
	  end

	end


	context 'Sizes & Alterations Popup Navigation:' do
		
		it '- Popup: Active on Initial Visit' do
			expect(@page.size_alterations_popup_element.present?).to eq(true)
		end

		it '- Popup: Next Button Disabled' do
			expect(@page.disabled_next_button?).to eq(true)
		end

		it '- Popup: Cancel Button Redirect' do
			@page.popup_cancel_button_element.click
			expect(@page.url).to include('/additional-options')
		end
		
		it '- Popup: Active on Subsequent Visit' do
			@page.breadcrumb_sizes_alterations_element.click
			expect(@page.size_alterations_popup?).to eq(true)
		end

		it '- Popup: Click Garment Checkbox' do
			@page.popup_checkbox_element.focus
	  	@page.popup_checkbox_element.set(true)
	  	expect(@page.popup_checkbox_element.set?).to eq(true)
	  end

	  it '- Popup: Next Button Enabled' do
	  	expect(@page.disabled_next_button?).to eq(false)
	  end

	  it '- Popup: Next Button Redirect' do
	  	@page.popup_next_button_element.click
	  	expect(@page.saving_design?).to eq(true)
	  end

	end

end
