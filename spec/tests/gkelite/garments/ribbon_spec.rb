require './lib/pages/gkelite/customizer_page'

describe "< #7560: Women's Athletic Ribbon Gymnastics Leotard - Customizer Unit Test >" do



  before(:all) do
    BasePage.setup
    @page = CustomizerPage.new
    @page.ribbon
  end

  before(:each) do
    @arr = Array.new
  end





  ##########################
  ## Design & Colors Page ##
  ##########################
  ##    Sleeve Length     ##
  ##########################


  context 'Design & Color Page: Sleeve Length' do

    it '- Default Long Sleeve' do
      @page.wait_until { @page.page_load? }
      expect(@page.long_sleeve_selected?).to eq(true)
    end

    it '- Set 3/4 Sleeve' do
      @page.wait_until { @page.three_quarter? }
      @page.three_quarter_element.focus
      @page.three_quarter_element.click
      expect(@page.three_quarter_selected?).to eq(true)
    end

    it '- Header Updates to 3/4 Sleeve' do
      expect(@page.selected_sleeve_length.to_s).to eq('3/4 Sleeve')
    end

    it '- Set Long Sleeve' do
      @page.long_sleeve_element.focus
      @page.long_sleeve_element.click
      expect(@page.long_sleeve_selected?).to eq(true)
    end

    it '- Header Updates to Long Sleeve' do 
      expect(@page.selected_sleeve_length.to_s).to eq('Long Sleeve')
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end




  ##########################
  ##        Area A        ##
  ##########################


  context 'Design & Color Page: Area A' do

    it '- Expand Area A Accordian' do
      @page.second_accordian_element.click
      expect(@page.accordian_label).to eq("Area A")
    end
  end


    ###############################
    ###### Fabric Option 1 ########
    ###############################
  context 'Area A: Fabric Option 1' do
    it '- Set Fabric Option 1: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
      expect(@page.first_dropdown).to include('Hologram')
    end

    it '- Fabric Hologram: Gradient Modal' do
      @page.edit_gradient_element.click
      expect(@page.gradient_modal_popup?).to eq(true)
    end

    it '- Fabric Hologram: Verify Gradient Colors' do
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($hologram_colors)
    end

    it '- Fabric Hologram: Close Gradient Modal' do
      @page.gradient_modal_close_element.click
      expect(@page.gradient_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end


    ###############################
    ###### Fabric Option 2 ########
    ###############################
  context 'Area A: Fabric Option 2' do
    it '- Set Fabric Option 2: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Fabric Nylon/Spandex with Foil: Open Gradient Modal' do
      @page.edit_gradient_element.click
      expect(@page.gradient_modal_popup?).to eq(true)
    end

    it '- Fabric Nylon/Spandex with Foil: Verify Gradient Colors' do
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($foil_colors)
    end

    it '- Fabric Nylon/Spandex with Foil: Close Gradient Modal' do
      @page.gradient_modal_close_element.click
      expect(@page.gradient_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end




    ###############################
    ###### Fabric Option 3 ########
    ###############################
  context 'Area A: Fabric Option 3' do
    it '- Set Fabric Option 3: Nylon/Spandex' do
      @page.first_dropdown=@page.first_dropdown_options[2]
      expect(@page.first_dropdown).to include('Nylon/Spandex')
    end

    it '- Fabric Nylon/Spandex: Open Gradient Modal' do
      @page.edit_gradient_element.click
      expect(@page.gradient_modal_popup?).to eq(true)
    end

    it '- Fabric Nylon/Spandex: Verify Gradient Colors' do
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($nylon_spandex_colors)
    end

    it '- Fabric Nylon/Spandex: Close Gradient Modal' do
      @page.gradient_modal_close_element.click
      expect(@page.gradient_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end


    ###############################
    ###### Fabric Option 4 ########
    ###############################

  context 'Area A: Fabric Option 4' do
    it '- Set Fabric Option 4: Sublimation on Holotek' do
      @page.first_dropdown=@page.first_dropdown_options[3]
      expect(@page.first_dropdown).to include('Sublimation on Holotek')
    end

    it '- Fabric Sublimation on Holotek: Open Gradient Modal' do
      @page.edit_gradient_element.click
      expect(@page.gradient_modal_popup?).to eq(true)
    end

    it '- Fabric Sublimation on Holotek: Set 3-Color Colorcount' do
      @page.colorcount_dropdown=@page.colorcount_dropdown_options[0]
      expect(@page.colorcount_dropdown).to include('3-Color')
    end

    it '- Fabric Sublimation on Holotek: Pink Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[0]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($three_color_pink)
    end 

    it '- Fabric Sublimation on Holotek: Purple Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[1]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($three_color_purple)
    end

    it '- Fabric Sublimation on Holotek: Patriotic Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[2]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($three_color_patriotic)
    end

    it '- Fabric Sublimation on Holotek: Blue Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[3]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($three_color_blue)
    end

    it '- Fabric Sublimation on Holotek: Enable Reverse Gradient Button' do
      @page.reverse_button_element.click 
      expect(@page.reverse_button_enabled?).to eq(true)
    end

    it '- Fabric Sublimation on Holotek: Reverse Pink Gradients' do      
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[0]
      @page.reverse_button_element.click
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_three_color_pink)
    end

    it '- Fabric Sublimation on Holotek: Reverse Purple Gradients' do      
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[1]
      @page.reverse_button_element.click
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_three_color_purple)
    end

    it '- Fabric Sublimation on Holotek: Reverse Patriotic Gradients' do      
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[2]
      @page.reverse_button_element.click
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_three_color_patriotic)
    end

    it '- Fabric Sublimation on Holotek: Reverse Blue Gradients' do      
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[3]
      @page.reverse_button_element.click
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_three_color_blue)
    end

    it '- Fabric Sublimation on Holotek: Set 2-Color Colorcount' do
      @page.colorcount_dropdown=@page.colorcount_dropdown_options[1]
      expect(@page.colorcount_dropdown).to include('2-Color')
    end

    it '- Fabric Sublimation on Holotek: Pink Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[0]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($two_color_pink)
    end

    it '- Fabric Sublimation on Holotek: Purple Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[1]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($two_color_purple)
    end

    it '- Fabric Sublimation on Holotek: Blue Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[3]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($two_color_blue)
    end

    it '- Fabric Sublimation on Holotek: Red Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[4]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($two_color_red)
    end

    it '- Fabric Sublimation on Holotek: Green Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[5]
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($two_color_green)
    end

    it '- Fabric Sublimation on Holotek: Enable Reverse Gradient Button' do
      @page.reverse_button_element.click 
      expect(@page.reverse_button_enabled?).to eq(true)
    end

    it '- Fabric Sublimation on Holotek: Reverse Pink Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[0]
      @page.reverse_button_element.click 
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_two_color_pink)
    end

    it '- Fabric Sublimation on Holotek: Reverse Purple Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[1]
      @page.reverse_button_element.click 
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_two_color_purple)
    end

    it '- Fabric Sublimation on Holotek: Reverse Blue Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[3]
      @page.reverse_button_element.click 
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_two_color_blue)
    end

    it '- Fabric Sublimation on Holotek: Reverse Red Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[4]
      @page.reverse_button_element.click 
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_two_color_red)
    end

    it '- Fabric Sublimation on Holotek: Reverse Green Combo Options' do
      @page.color_combo_dropdown=@page.color_combo_dropdown_options[5]
      @page.reverse_button_element.click 
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.selected_gradient)
      end
      expect(@arr).to match_array($reverse_two_color_green)
    end

    it '- Fabric Sublimation on Holotek: Close Gradient Modal' do
      @page.gradient_modal_close_element.click
      expect(@page.gradient_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end

  end



  ##################
  ##### AREA B #####
  ##################


  context 'Design & Color Page: Area B' do
    it '- Expand Area B Accordian' do
      @page.third_accordian_element.click
      expect(@page.edit_gradient?).to eq(true)
    end

    it '- Lower Body & Scrunchie Fabric: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
      expect(@page.first_dropdown).to include('Hologram')
    end

    it '- Hologram: Color Modal' do
      @page.edit_gradient_element.click
      expect(@page.gradient_modal_popup?).to eq(true)
    end

    it '- Cycle Hologram Colors' do
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.gradient_modal_header)
      end
      expect(@arr).to match_array($hologram_colors)
    end

    it '- Lower Body & Scrunchie: Close Color Modal' do
      @page.gradient_modal_close_element.click
      expect(@page.gradient_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end

    it '- Lower Body & Scrunchie Fabric: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Nylon/Spandex with Foil: Color Modal' do
      @page.edit_gradient_element.click
      expect(@page.gradient_modal_header?).to eq(true)
    end

    it '- Cycle Nylon/Spandex with Foil Colors' do
      @page.gradient_grid_elements.each do |x|
        x.click
        @arr.push(@page.gradient_modal_header)
      end
      expect(@arr).to match_array($foil_colors)
    end

    it '- Lower Body & Scrunchie: Close Color Modal' do
      @page.gradient_modal_close_element.click
      expect(@page.gradient_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end



  ##################
  ##### AREA C #####
  ##################


  context 'Design & Color Page: Area C' do

    it '- Expand Area C Accordian' do
      @page.fourth_accordian_element.click
      expect(@page.edit_first_color?).to eq(true)
    end

    it '- Front Body Appliques Fabric: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
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

    it '- Front Body Appliques: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end

    it '- Front Body Appliques Fabric: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Nylon/Spandex with Foil: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.first_modal_header?).to eq(true)
    end

    it '- Cycle Nylon/Spandex with Foil Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($foil_colors)
    end

    it '- Front Body Appliques: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end






  ##################
  ##### AREA D #####
  ##################


  context 'Design & Color Page: Area D' do

    it '- Expand Area D Accordian' do
      @page.fifth_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
    end
  end


  context 'Area D: Fabric Option 1' do
    it '- Neck Biding Fabric: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
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

  
  
  context 'Area D: Fabric Option 2' do
    it '- Neck Binding Fabric: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
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







##################
##### AREA E #####
##################


  context 'Design & Color Page: Area E' do

    it '- Expand Area E Accordian' do
      @page.sixth_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
    end
  end



  context 'Area E: Fabric Option 1' do
    it '- Neck Binding Fabric: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
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


  context 'Area E: Fabric Option 2' do
    it '- Neck Binding Fabric: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
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









  ##################
  ##### AREA 1 #####
  ##################


  context 'Design & Color Page: Area 1' do

    it '- Expand Area 1 Accordian' do
      @page.seventh_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
    end

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


  context 'Design & Color Page: GK Logo' do

    it '- Expand GK Logo Accordian' do
      @page.eighth_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
    end

    it '- GK Logo: Embroidery' do
      @page.first_dropdown=@page.first_dropdown_options[0]
      expect(@page.first_dropdown).to include('Embroidery')
    end

    it '- GK Logo: Embroidery Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.first_modal_header?).to eq(true)
    end

    it '- GK Logo: Verify Embroidery Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($embroidery_colors)
    end

    it '- GK Logo: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it '- GK Logo: Crystals' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Crystals')
    end

    it '- GK Logo Crystals: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.first_modal_header?).to eq(true)
    end

    it '- GK Logo: Crystals Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr).to match_array($crystal_colors)
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
      @page.disclaimer_checkbox_element.focus
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






  ##########################
  ##  Additional Designs  ##
  ##########################

  context 'Embellishments Page: Additional Designs' do

    it '- Expand Additional Designs Accordian' do
      expect(@page.multioption_one?).to eq(true)
    end
  end

  context 'Additional Designs: Option 1' do
    it '- Additional Designs Option: T625' do
      @page.multioption_one_element.click
      expect(@page.multioption_one_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: T625 Edit Color' do
      @page.edit_pos_one_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: T625 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_one)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs T625 Color: Close Modal' do
      @page.embellishment_modal_close_one_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

  context 'Additional Designs: Option 1' do
    it '- Additional Designs Option: T623' do
      @page.multioption_two_element.click
      expect(@page.multioption_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: T623 Edit Color' do
      @page.multioption_two_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: T623 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_two)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs T623 Color: Close Modal' do
      @page.embellishment_modal_close_two_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

  context 'Additional Designs: Option 1' do
        it '- Additional Designs Option: J751' do
      @page.multioption_three_element.click
      expect(@page.multioption_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J751 Edit Color' do
      @page.multioption_three_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J751 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_three)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J751 Color: Close Modal' do
      @page.embellishment_modal_close_three_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end


  context 'Additional Designs: Option 1' do
        it '- Additional Designs Option: J14' do
      @page.multioption_four_element.click
      expect(@page.multioption_four_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J14 Edit Color' do
      @page.multioption_four_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J14 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_four)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J14 Color: Close Modal' do
      @page.embellishment_modal_close_four_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end





  ####################
  ##  Cuff Designs  ##
  ####################


  context 'Embellishments Page: Cuff Designs' do
    it '- Expand Cuff Designs Accordian' do
      @page.sub_accordian_two_element.click
      expect(@page.single_option_one?).to eq(true)     
    end

    it '- Cuff Designs Option: None' do
      @page.single_option_one_element.click
      expect(@page.single_option_one_element.attribute('class')).not_to include('select-none')
    end

    it '- Cuff Designs Option: J250' do
      @page.single_option_two_element.click
      expect(@page.single_option_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Cuff Designs Option: T249' do
      @page.single_option_three_element.click
      expect(@page.single_option_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Cuff Designs Option: T728' do
      @page.single_option_four_element.click
      expect(@page.single_option_four_element.attribute('class')).not_to include('select-none')
    end

    it '- Cuff Designs Option: T860' do
      @page.single_option_five_element.click
      expect(@page.single_option_five_element.attribute('class')).not_to include('select-none')
    end

    it '- Cuff Designs Color: Edit Color' do
      @page.edit_pos_one_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cuff Designs Color: Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_one)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Cuff Designs Color: Close Modal' do
      @page.embellishment_modal_close_one_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end


















###########################
##  Lettering & Artwork  ##
###########################


  context 'Embellishments Page: Lettering & Artwork' do
    it '- Expand Lettering & Artwork Accordian' do
      @page.second_accordian_element.click
      expect(@page.lettering_artwork_info?).to eq(true)
    end
  end

  #    it '- Lettering & Artwork: Info Page Link' do
  #      @page.embellishment_info_link_element.click
  #      expect(@page.url).to include('/embellishments')
  #      $driver.window.close
  #    end

  ##################################################################
  ##  Front Center Chest  #### Custom Artwork ####    No Mesh     ##
  ##################################################################


  context 'Embellishments Page: Front Center Chest Artwork' do

    it '- Lettering & Artwork: Expand Front Center Chest Accordian' do
      @page.sub_accordian_two_element.click
    end

    it '- Front Center Chest: Custom Artwork Radio' do
      @page.custom_artwork_element.click
    end

    it '- Front Center Chest: Embellishment Types' do
      @page.embellishment_type_options.each do |x|
        @page.embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Front Center Chest: Upload File' do
      @page.upload_alt='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
    end

    it '- Front Center Chest: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Front Center Chest: Artwork Add Comment' do
      @page.art_comment_alt_element.send_keys 'This is a Test'
      expect(@page.art_comment_alt).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end















    ##########################
    ##  Front Center Chest  ##
    ########################## 
    ##    Lettering    ##
    ##     No Mesh     ##
    #####################

  context 'Embellishments Page: Front Center Chest Lettering' do

    
    it '- Front Center Chest: Lettering Radio' do
      @page.lettering_pos_one_element.click
      expect(@page.lettering_pos_one_element.set?).to eq(true)
    end


    it '- Lettering Embellishment Type Non-Mesh Option: Small Embroidery' do
      @page.embellishment_type=@page.embellishment_type_options[0]
      expect(@page.embellishment_type).to eq('Small Embroidery')
    end

    it '- Lettering Embellishment Type Small Embroidery: Color Modal' do
      @page.lettering_color_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(true)
    end

    it '- Lettering Embellishment Type Small Embroidery: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header_alt)
      end
      expect(@arr.sort).to match_array($embroidery_colors.sort)
    end

    it '- Lettering Embellishment Type Small Embroidery: Close Modal' do
      @page.lettering_modal_close_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(false)
    end


    it '- Lettering Embellishment Type Non-Mesh Option: Large Embroidery' do
      @page.embellishment_type=@page.embellishment_type_options[1]
      expect(@page.embellishment_type).to eq('Large Embroidery')
    end

    it '- Lettering Embellishment Type Large Embroidery: Color Modal' do
      @page.lettering_color_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(true)
    end

    it '- Lettering Embellishment Type Large Embroidery: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header_alt)
      end
      expect(@arr.sort).to match_array($embroidery_colors.sort)
    end

    it '- Lettering Embellishment Type Large Embroidery: Close Modal' do
      @page.lettering_modal_close_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(false)
    end

    it '- Lettering Embellishment Type Non-Mesh Option: Imprinting' do
      @page.embellishment_type=@page.embellishment_type_options[2]
      expect(@page.embellishment_type).to eq('Imprinting Lettering')
    end

    it '- Lettering Embellishment Type Imprinting: Color Modal' do
      @page.lettering_color_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(true)
    end

    it '- Lettering Embellishment Type Imprinting: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header_alt)
      end
      expect(@arr.sort).to match_array($imprinting_colors.sort)
    end

    it '- Lettering Embellishment Type Imprinting: Close Modal' do
      @page.lettering_modal_close_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(false)
    end

    it '- Lettering Non-Mesh Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr).to eq($font_options)
    end

    it '- Lettering Non-Mesh Options: One Line Position' do
      @page.position=@page.position_options[0]
      expect(@page.text_line_one?).to eq(true)
    end

    it '- Lettering Non-Mesh Options: Two Line Position' do
      @page.position=@page.position_options[1]
      expect(@page.text_line_two_alt?).to eq(true)
    end

    it '- Lettering Non-Mesh Text Position: Curved Line' do
      @page.position=@page.position_options[2]
      expect(@page.text_line_two_alt?).not_to eq(true)
    end

    it '- Lettering Non-Mesh Options: Text Line 1' do
      @page.position=@page.position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Non-Mesh Options: Text Line 2' do
      @page.text_line_two_alt_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_two_alt).to include('Test Test Test Test Test')
    end

    it '- Front Center Chest: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Front Center Chest: Lettering Add Comment' do
      @page.comment_element.send_keys 'This is a Test'
      expect(@page.comment).to include("This is a Test")
    end

    it '- Front Center Chest: None Radio' do
      @page.none_element.click
      expect(@page.embellishment_type_element.present?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end
















#############################
##  Left Sleeve Accordian  ##
#############################
  context 'Embellishments Page: Left Sleeve' do

    it '- Lettering & Artwork: Expand Left Sleeve Accordian' do
      @page.sub_accordian_two_element.click
    end
  end

###############################################################################
##  Left Sleeve  ####  Upper Sleeve  #### Custom Artwork ####    No Mesh     ##
############################################################################### 
  context 'Embellishments Page: Upper Left Sleeve Artwork' do

    it '- Left Sleeve: Upper Location' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[0]
      expect(@page.sleeve_location_dropdown).to include("Upper Sleeve")
    end

    it '- Upper Left Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
      expect(@page.custom_artwork_element.set?).to eq(true)
    end

    it '- Upper Left Sleeve: Embellishment Types' do
      @page.upper_embellishment_type_options.each do |x|
        @page.upper_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Upper Left Sleeve: Upload File' do
      @page.upload='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
      expect(@page.uploading?).to eq(true)
    end

    it '- Upper Left Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys(:home)
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Upper Left Sleeve: Artwork Add Comment' do
      @page.artwork_comment_element.send_keys 'This is a Test'
      expect(@page.artwork_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end





















##########################################################################
##  Left Sleeve  ####  Upper Sleeve  #### Lettering ####    No Mesh     ##
##########################################################################
  context 'Embellishments Page: Upper Left Sleeve Lettering' do

    it '- Upper Left Sleeve: Lettering Radio' do
      @page.lettering_element.click
      expect(@page.lettering_selected?).to eq(true)
    end

    it '- Lettering Embellishment Type Option: Imprinting' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[1]
      expect(@page.upper_embellishment_type).to eq('Imprinting Lettering')
    end

    it '- Lettering Embellishment Type Imprinting: Color Modal' do
      @page.lettering_color_element.click
      expect(@page.lettering_modal_close?).to eq(true)
    end

    it '- Lettering Embellishment Type Imprinting: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header)
      end
      expect(@arr.sort).to match_array($imprinting_colors.sort)
    end

    it '- Lettering Embellishment Type Imprinting: Close Modal' do
      @page.lettering_modal_close_element.click
      expect(@page.lettering_modal_close?).to eq(false)
    end

    it '- Lettering Embellishment Type Option: Small Embroidery' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[0]
      expect(@page.upper_embellishment_type).to eq('Small Embroidery')
    end

    it '- Lettering Embellishment Type Small Embroidery: Color Modal' do
      @page.lettering_color_element.click
      expect(@page.lettering_modal_close?).to eq(true)
    end

    it '- Lettering Embellishment Type Small Embroidery: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header)
      end
      expect(@arr.sort).to match_array($embroidery_colors.sort)
    end

    it '- Lettering Embellishment Type Small Embroidery: Close Modal' do
      @page.lettering_modal_close_element.click
      expect(@page.lettering_modal_close?).to eq(false)
    end

    it '- Lettering Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr.sort).to match_array($font_options.sort)
    end

    it '- Lettering Orientation Options: Cycle Orientation Options' do
      @page.lettering_orientation_options.each do |x|
        @page.lettering_orientation=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($orientation_upper.sort)
    end

    it '- Vertical Up Orientation: Position Dropdown Unavailable' do
      @page.lettering_orientation=@page.lettering_orientation_options[1]
      expect(@page.lettering_position_element.present?).to eq(false)
    end

    it '- Vertical Down Orientation: Position Dropdown Unavailable' do
      @page.lettering_orientation=@page.lettering_orientation_options[2]
      expect(@page.lettering_position_element.present?).to eq(false)
    end

    it '- Horizontal Orientation: Position Dropdown Available' do
      @page.lettering_orientation=@page.lettering_orientation_options[0]
      expect(@page.lettering_position_element.present?).to eq(true)
    end

    it '- Lettering Options: One Line Position' do
      @page.lettering_position=@page.lettering_position_options[0]
      expect(@page.text_line_two_element.present?).to eq(false)
    end

    it '- Lettering Options: Two Line Position' do
      @page.lettering_position=@page.lettering_position_options[1]
      expect(@page.text_line_two_element.present?).to eq(true)
    end

    it '- Lettering Text Position: Curved Line' do
      @page.lettering_position=@page.lettering_position_options[2]
      expect(@page.text_line_two_element.present?).to eq(false)
    end

    it '- Lettering Options: Text Line 1' do
      @page.lettering_position=@page.lettering_position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Options: Text Line 2' do
      @page.text_line_two_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_two).to include('Test Test Test Test Test')
    end

    it '- Upper Left Sleeve: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Upper Left Sleeve: Lettering Add Comment' do
      @page.lettering_comment_element.send_keys 'This is a Test'
      expect(@page.lettering_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end





















###############################################################################
##  Left Sleeve  ####   Full Sleeve  #### Custom Artwork ####    No Mesh     ##
###############################################################################
  context 'Embellishments Page: Left Full Sleeve Artwork' do

    it '- Left Sleeve: Full Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[1]
      expect(@page.sleeve_location_dropdown).to include("Full Sleeve")
    end

    it '- Left Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
      expect(@page.custom_artwork_element.set?).to eq(true)
    end

    it '- Left Sleeve: Embroidery Option' do
      @page.full_embellishment_type_options.each do |x|
        @page.full_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Left Sleeve: Upload File' do
      @page.upload_full='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
      expect(@page.uploading?).to eq(true)
    end

    it '- Left Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys(:home)
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Left Sleeve: Artwork Add Comment' do
      @page.full_art_comment_element.send_keys 'This is a Test'
      expect(@page.full_art_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end







##########################################################################
##  Left Sleeve  ####  Full Sleeve  #### Lettering ####     No Mesh     ##
##########################################################################
  context 'Full Left Sleeve: Lettering' do

    it '- Left Sleeve: Full Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[1]
      expect(@page.sleeve_location_dropdown).to include("Full Sleeve")
    end

    it '- Full Left Sleeve: Lettering Radio' do
      @page.full_lettering_radio_element.click
      expect(@page.full_lettering_radio_element.set?).to eq(true)
    end

    it ' - Full Left Sleeve: Edit Lettering Color' do 
      @page.edit_full_letter_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Lettering Embellishment Type Imprinting: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.full_lettering_header)
      end
      expect(@arr).to match_array($imprinting_colors)
    end

    it '- Full Left Sleeve: Close Lettering Color Modal' do
      @page.close_full_letter_modal_element.click
      expect(@page.close_full_letter_modal?).not_to eq(true)
    end

    it '- Lettering Non-Mesh Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr).to match_array($font_options)
    end

    it '- Lettering Orientation Options: Cycle Orientation Options' do
      @page.full_orientation_options.each do |x|
        @page.full_orientation=x
        @arr.push(x)
      end
      expect(@arr).to match_array($orientation_full)
    end

    it '- Lettering Non-Mesh Options: Text Line 1' do
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Full Left Sleeve: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Full Left Sleeve: Lettering Add Comment' do
      @page.full_letter_comment_element.send_keys 'This is a Test'
      expect(@page.full_letter_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end






##############################
##  Right Sleeve Accordian  ##
##############################


  context 'Embellishments Page: Right Sleeve' do

    it '- Lettering & Artwork: Expand Right Sleeve Accordian' do
      @page.sub_accordian_three_element.click
    end
  end




################################################################################
##  Right Sleeve  ####  Upper Sleeve  #### Custom Artwork ####    No Mesh     ##
################################################################################

  context 'Embellishments Page: Upper Right Sleeve Artwork' do

    it '- Right Sleeve: Upper Location' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[0]
      expect(@page.sleeve_location_dropdown).to include("Upper Sleeve")
    end

    it '- Right Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
      expect(@page.custom_artwork_element.set?).to eq(true)
    end

    it '- Right Sleeve: Embellishment Types' do
      @page.upper_embellishment_type_options.each do |x|
        @page.upper_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Right Sleeve: Upload File' do
      @page.upload='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
      expect(@page.uploading?).to eq(true)
    end

    it '- Right Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys(:home)
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Right Sleeve: Artwork Add Comment' do
      @page.artwork_comment_element.send_keys 'This is a Test'
      expect(@page.artwork_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

















###########################################################################
##  Right Sleeve  ####  Upper Sleeve  #### Lettering ####    No Mesh     ##
###########################################################################
context 'Embellishments Page: Upper Right Sleeve Lettering' do

    it '- Upper Right Sleeve: Lettering Radio' do
      @page.lettering_element.click
      expect(@page.lettering_selected?).to eq(true)
    end

    it '- Lettering Embellishment Type Option: Imprinting' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[1]
      expect(@page.upper_embellishment_type).to eq('Imprinting Lettering')
    end

    it '- Lettering Embellishment Type Imprinting: Color Modal' do
      @page.lettering_color_element.click
      expect(@page.lettering_modal_close?).to eq(true)
    end

    it '- Lettering Embellishment Type Imprinting: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header)
      end
      expect(@arr.sort).to match_array($imprinting_colors.sort)
    end

    it '- Lettering Embellishment Type Imprinting: Close Modal' do
      @page.lettering_modal_close_element.click
      expect(@page.lettering_modal_close?).to eq(false)
    end

    it '- Lettering Embellishment Type Option: Small Embroidery' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[0]
      expect(@page.upper_embellishment_type).to eq('Small Embroidery')
    end

    it '- Lettering Embellishment Type Small Embroidery: Color Modal' do
      @page.lettering_color_element.click
      expect(@page.lettering_modal_close?).to eq(true)
    end

    it '- Lettering Embellishment Type Small Embroidery: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header)
      end
      expect(@arr.sort).to match_array($embroidery_colors.sort)
    end

    it '- Lettering Embellishment Type Small Embroidery: Close Modal' do
      @page.lettering_modal_close_element.click
      expect(@page.lettering_modal_close?).to eq(false)
    end

    it '- Lettering Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr.sort).to match_array($font_options.sort)
    end

    it '- Lettering Orientation Options: Cycle Orientation Options' do
      @page.lettering_orientation_options.each do |x|
        @page.lettering_orientation=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($orientation_upper.sort)
    end

    it '- Vertical Up Orientation: Position Dropdown Unavailable' do
      @page.lettering_orientation=@page.lettering_orientation_options[1]
      expect(@page.lettering_position_element.present?).to eq(false)
    end

    it '- Vertical Down Orientation: Position Dropdown Unavailable' do
      @page.lettering_orientation=@page.lettering_orientation_options[2]
      expect(@page.lettering_position_element.present?).to eq(false)
    end

    it '- Horizontal Orientation: Position Dropdown Available' do
      @page.lettering_orientation=@page.lettering_orientation_options[0]
      expect(@page.lettering_position_element.present?).to eq(true)
    end

    it '- Lettering Options: One Line Position' do
      @page.lettering_position=@page.lettering_position_options[0]
      expect(@page.text_line_two_element.present?).to eq(false)
    end

    it '- Lettering Options: Two Line Position' do
      @page.lettering_position=@page.lettering_position_options[1]
      expect(@page.text_line_two_element.present?).to eq(true)
    end

    it '- Lettering Text Position: Curved Line' do
      @page.lettering_position=@page.lettering_position_options[2]
      expect(@page.text_line_two_element.present?).to eq(false)
    end

    it '- Lettering Options: Text Line 1' do
      @page.lettering_position=@page.lettering_position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Options: Text Line 2' do
      @page.text_line_two_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_two).to include('Test Test Test Test Test')
    end

    it '- Upper Right Sleeve: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Upper Right Sleeve: Lettering Add Comment' do
      @page.lettering_comment_element.send_keys 'This is a Test'
      expect(@page.lettering_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end























###############################################################################
##  Right Sleeve  ####   Full Sleeve  #### Custom Artwork ####    No Mesh    ##
###############################################################################
  context 'Embellishments Page: Right Full Sleeve Artwork' do

    it '- Right Sleeve: Full Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[1]
      expect(@page.sleeve_location_dropdown).to include("Full Sleeve")
    end

    it '- Right Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
      expect(@page.custom_artwork_element.set?).to eq(true)
    end

    it '- Right Sleeve: Embellishment Types' do
      @page.full_embellishment_type_options.each do |x|
        @page.full_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Right Sleeve: Upload File' do
      @page.upload_full='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
      expect(@page.uploading?).to eq(true)
    end

    it '- Right Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys(:home)
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Right Sleeve: Artwork Add Comment' do
      @page.full_art_comment_element.send_keys 'This is a Test'
      expect(@page.full_art_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end











##########################################################################
##  Right Sleeve  ####  Full Sleeve  #### Lettering ####     No Mesh     ##
##########################################################################
  context 'Full Right Sleeve: Lettering' do

    it '- Right Sleeve: Full Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[1]
      expect(@page.sleeve_location_dropdown).to include("Full Sleeve")
    end

    it '- Full Right Sleeve: Lettering Radio' do
      @page.full_lettering_radio_element.click
      expect(@page.full_lettering_radio_element.set?).to eq(true)
    end

    it ' - Full Right Sleeve: Edit Lettering Color' do 
      @page.edit_full_letter_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Lettering Embellishment Type Imprinting: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.full_lettering_header)
      end
      expect(@arr).to match_array($imprinting_colors)
    end

    it '- Full Right Sleeve: Close Lettering Color Modal' do
      @page.close_full_letter_modal_element.click
      expect(@page.close_full_letter_modal?).not_to eq(true)
    end

    it '- Lettering Non-Mesh Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr).to match_array($font_options)
    end

    it '- Lettering Orientation Options: Cycle Orientation Options' do
      @page.full_orientation_options.each do |x|
        @page.full_orientation=x
        @arr.push(x)
      end
      expect(@arr).to match_array($orientation_full)
    end

    it '- Lettering Non-Mesh Options: Text Line 1' do
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Full Right Sleeve: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Full Right Sleeve: Lettering Add Comment' do
      @page.full_letter_comment_element.send_keys 'This is a Test'
      expect(@page.full_letter_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end
















#######################################
##  Center Back  #### Custom Artwork ##
#######################################
    


  context 'Embellishments Page: Center Back Artwork' do

    it '- Lettering & Artwork: Expand Center Back Accordian' do
      @page.sub_accordian_four_element.click
    end

    it '- Center Back: Custom Artwork Radio' do
      @page.custom_artwork_element.click
    end

    it '- Center Back: Embellishment Types' do
      @page.embellishment_type_options.each do |x|
        @page.embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Center Back: Upload File' do
      @page.upload_alt='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
    end

    it '- Center Back: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Center Back: Artwork Add Comment' do
      @page.art_comment_alt_element.send_keys 'This is a Test'
      expect(@page.art_comment_alt).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end





















######################################
##  Center Back  ####   Lettering   ##
######################################
    


  context 'Embellishments Page: Center Back Lettering' do

    it '- Center Back: Lettering Radio' do
      @page.lettering_alt_element.click
      expect(@page.lettering_alt_element.set?).to eq(true)
    end

    it '- Lettering Embellishment Type Non-Mesh Option: Small Embroidery' do
      @page.embellishment_type=@page.embellishment_type_options[0]
      expect(@page.embellishment_type).to eq('Small Embroidery')
    end

    it '- Lettering Embellishment Type Small Embroidery: Color Modal' do
      @page.lettering_color_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(true)
    end

    it '- Lettering Embellishment Type Small Embroidery: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header_alt)
      end
      expect(@arr.sort).to match_array($embroidery_colors.sort)
    end

    it '- Lettering Embellishment Type Small Embroidery: Close Modal' do
      @page.lettering_modal_close_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(false)
    end

    it '- Lettering Embellishment Type Non-Mesh Option: Large Embroidery' do
      @page.embellishment_type=@page.embellishment_type_options[1]
      expect(@page.embellishment_type).to eq('Large Embroidery')
    end

    it '- Lettering Embellishment Type Large Embroidery: Color Modal' do
      @page.lettering_color_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(true)
    end

    it '- Lettering Embellishment Type Large Embroidery: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header_alt)
      end
      expect(@arr.sort).to match_array($embroidery_colors.sort)
    end

    it '- Lettering Embellishment Type Large Embroidery: Close Modal' do
      @page.lettering_modal_close_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(false)
    end

    it '- Lettering Embellishment Type Non-Mesh Option: Imprinting' do
      @page.embellishment_type=@page.embellishment_type_options[2]
      expect(@page.embellishment_type).to eq('Imprinting Lettering')
    end

    it '- Lettering Embellishment Type Imprinting: Color Modal' do
      @page.lettering_color_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(true)
    end

    it '- Lettering Embellishment Type Imprinting: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header_alt)
      end
      expect(@arr.sort).to match_array($imprinting_colors.sort)
    end

    it '- Lettering Embellishment Type Imprinting: Close Modal' do
      @page.lettering_modal_close_alt_element.click
      expect(@page.lettering_modal_close_alt?).to eq(false)
    end

    it '- Lettering Non-Mesh Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.selected_font_alt)
      end
      expect(@arr.sort).to eq($font_options.sort)
    end

    it '- Lettering Non-Mesh Options: One Line Position' do
      @page.position=@page.position_options[0]
      expect(@page.text_line_one?).to eq(true)
    end

    it '- Lettering Non-Mesh Options: Two Line Position' do
      @page.position=@page.position_options[1]
      expect(@page.text_line_two_alt?).to eq(true)
    end

    it '- Lettering Non-Mesh Text Position: Curved Line' do
      @page.position=@page.position_options[2]
      expect(@page.text_line_two_alt?).not_to eq(true)
    end

    it '- Lettering Non-Mesh Options: Text Line 1' do
      @page.position=@page.position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Non-Mesh Options: Text Line 2' do
      @page.text_line_two_alt_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_two_alt).to include('Test Test Test Test Test')
    end

    it '- Center Back: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Center Back: Lettering Add Comment' do
      @page.comment_element.send_keys 'This is a Test'
      expect(@page.comment).to include("This is a Test")
    end

#    it '- Center Back: None Radio' do
#      @page.none_element.click
#      expect(@page.embellishment_type_element.present?).to eq(false)
#    end

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

    it '- Adult Leg Cut: Options' do
      @page.adult_leg_dropdown_options.each do |x|
        @page.adult_leg_dropdown=x
        @arr.push(x)
      end
      expect(@page.adult_leg_dropdown_options).to match_array(@arr)
    end

    it '- Child Leg Cut: Options' do
      @page.child_leg_dropdown_options.each do |x|
        @page.child_leg_dropdown=x
        @arr.push(x)
      end
      expect(@page.child_leg_dropdown_options).to match_array(@arr)
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