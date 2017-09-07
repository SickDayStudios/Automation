require './lib/pages/gkelite/customizer_page'

describe "< #4892s: Women's Floral Fusion Sublimated Leotard - Customizer Unit Test >" do

  before(:all) do
    @page = CustomizerPage.new
    @page.floralfusion
  end

  before(:each) do
    @arr = Array.new
  end







  ##########################
  ##        Area A        ##
  ##########################


  ###### Fabric Option 1 ########


  context 'Area A: Fabric Option 1: Sublimation on Holotek' do


    it '- Fabric Sublimation on Holotek: Area R Color Modal' do
      @page.wait_until { @page.page_load? }
      sleep 2
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Area R: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr.sort).to match_array($sublimation_colors.sort)
    end

    it '- Area R: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end

    it '- Fabric Sublimation on Holotek: Area S Color Modal' do
      @page.edit_second_color_alt_element.focus
      @page.edit_second_color_alt_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Area S: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lining_modal_header)
      end
      expect(@arr.sort).to match_array($sublimation_colors.sort)
    end

    it '- Area S: Close Color Modal' do
      @page.lining_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end

    it '- Fabric Sublimation on Holotek: Area V Color Modal' do
      @page.edit_second_color_element.focus
      @page.edit_second_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Area V: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.color_modal_header)
      end
      expect(@arr.sort).to match_array($sublimation_colors.sort)
    end

    it '- Area V: Close Color Modal' do
      @page.second_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end








   ##################
  ##### AREA 1 #####
  ##################


  context 'Design & Color Page: Area 1' do

    it '- Expand Area 1 Accordian' do
      @page.second_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
    end
  end

###### Fabric Option 1 ########
  context 'Area 1: Fabric Option 1' do
    it '- Neck Binding Fabric: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[0]
      expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Nylon/Spandex with Foil: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cycle Nylon/Spandex with Foil Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($foil_colors)
    end

    it '- Neck Binding: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end


###### Fabric Option 2 ########
  context 'Area 1: Fabric Option 2' do
    it '- Neck Binding Fabric: Velvet' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Velvet')
    end

    it '- Velvet: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cycle Velvet Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($velvet_colors)
    end

    it '- Neck Binding: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

###### Fabric Option 3 ########
  context 'Area 1: Fabric Option 3' do
    it '- Neck Binding Fabric: Nylon/Spandex' do
      @page.first_dropdown=@page.first_dropdown_options[2]
      expect(@page.first_dropdown).to include('Nylon/Spandex')
    end

    it '- Nylon/Spandex: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cycle Nylon/Spandex Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($nylon_spandex_colors)
    end

    it '- Neck Binding: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

###### Fabric Option 4 ########
  context 'Area 1: Fabric Option 4' do
    it '- Neck Binding Fabric: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[3]
      expect(@page.first_dropdown).to include('Hologram')
    end

    it '- Hologram: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cycle Hologram Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($hologram_colors)
    end

    it '- Neck Binding: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end













##################
#### GK Logo #####
##################


  context 'Design & Color Page: Sublimation GK Logo ' do

    it '- Expand GK Logo Accordian' do
      @page.third_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
    end

    it '- GK Logo: Sublimation Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.first_modal_header?).to eq(true)
    end

    it '- GK Logo: Verify Sublimation Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($sublimation_colors)
    end

    it '- GK Logo: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end
























  #########################
## Embellishments Page ##
#########################

  context 'Embellishments Page: Embellishment Designs' do

    it '- Disclaimer: Agree' do
      @page.wait_until { @page.page_load? }
      sleep 2
      @page.disclaimer_checkbox_element.set(true)
      expect(@page.disclaimer_checkbox_element.set?).to eq(true)
    end

    it '- Navigate: Embellishments Page' do
      @page.embellishments_button_element.click
      expect(@page.url).to include('/embellishments')
    end

    it '- Save Design' do
      @page.save_design_button_element.click
      expect(@page.saving_popup?).to eq(true)
      @page.wait_while { @page.saving_popup? }
    end
  end










  #########################
  ##        Set 1        ##
  #########################



  context 'Embellishments Page: Set 1' do

    it '- Set 1 Option: None' do
      @page.single_option_one_element.click
      expect(@page.single_option_one_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 1 Option: T1221' do
      @page.single_option_two_element.click
      expect(@page.single_option_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 1 Option: T1222' do
      @page.single_option_three_element.click
      expect(@page.single_option_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 1 Color: Edit Color' do
      @page.edit_pos_one_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Set 1 Color: Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_one)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Set 1 Color: Close Modal' do
      @page.embellishment_modal_close_one_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end















  ##########################
  ##  Additional Designs  ##
  ##########################

  context 'Embellishments Page: Additional Designs' do

    it '- Expand Additional Designs Accordian' do
      @page.sub_accordian_element.click
      expect(@page.multioption_one?).to eq(true)
    end
  end

  context 'Additional Designs: Option 1' do
    it '- Additional Designs Option: J1173' do
      @page.multioption_one_element.click
      expect(@page.multioption_one_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J1173 Edit Color' do
      @page.edit_pos_one_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J1173 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_one)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J1173 Color: Close Modal' do
      @page.embellishment_modal_close_one_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

















  #############################
  ## Additional Options Page ##
  #############################

  context 'Additional Options Page: Additional Options' do
    it '- Navigate: Additional Options Page' do
      @page.additional_options_button_element.click
      expect(@page.url).to include('/additional-options')
    end

    it '- Crotch Liner: Options' do
      @page.crotch_liner_dropdown_options.each do |x|
        @page.crotch_liner_dropdown=x
        @arr.push(x)
      end
      expect(@page.crotch_liner_dropdown_options).to match_array(@arr)
    end
  end
end