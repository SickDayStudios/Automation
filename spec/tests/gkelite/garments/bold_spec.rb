require './lib/pages/gkelite/customizer_page'

describe "< #7619: Women's Bold Bateau Competition Leotard - Customizer Unit Test >" do

  before(:all) do
    @page = CustomizerPage.new
    @page.bold
  end

  before(:each) do
    @arr = Array.new
  end













  ####################################################
  ## Design & Colors Page ####    Sleeve Length     ##
  ####################################################
  
  


  context 'Design & Color Page: Sleeve Length' do

  	it '- Default Long Sleeve' do
  		@page.wait_until { @page.page_load? }
  		sleep 2
  		expect(@page.long_sleeve_selected?).to eq(true)
  	end

  	it '- Set 3/4 Sleeve' do
  		@page.three_quarter_element.click
  		expect(@page.three_quarter_selected?).to eq(true)
  	end

  	it '- Header Updates to 3/4 Sleeve' do
  		expect(@page.selected_sleeve_length.to_s).to eq('3/4 Sleeve')
  	end

  	it '- Set Long Sleeve' do
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




  ###### Fabric Option 1 ########

  
  context 'Area A: Fabric Option 1' do
    it '- Set Fabric Option 1: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
      expect(@page.first_dropdown).to include('Hologram')
    end

    it '- Fabric Hologram: Color Modal' do
      @page.edit_first_color_element.focus
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Fabric Hologram: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr.sort).to match_array($hologram_colors.sort)
    end

    it '- Fabric Hologram: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end





  ###### Fabric Option 2 ########



  context 'Area A: Fabric Option 2' do

    it '- Set Fabric Option 2: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Fabric Nylon/Spandex with Foil: Open Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Fabric Nylon/Spandex with Foil: Verify color Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr.sort).to match_array($foil_colors.sort)
    end

    it '- Fabric Nylon/Spandex with Foil: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
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
      expect(@page.edit_first_color?).to eq(true)
    end
  end

###### Fabric Option 1 ########
  context 'Area B: Fabric Option 1' do
    it '- Lower Body & Scrunchie Fabric: Hologram' do
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

    it '- Lower Body & Scrunchie: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

###### Fabric Option 2 ########
  context 'Area B: Fabric Option 2' do
    it '- Lower Body & Scrunchie Fabric: Nylon/Spandex with Foil' do
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

    it '- Lower Body & Scrunchie: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.first_modal_header?).to eq(false)
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
      expect(@page.edit_first_color_alt?).to eq(true)
    end
  end

###### Fabric Option 1 ########

  context 'Area C: Fabric Option 1' do
    it '- Front Body Appliques Fabric: Hologram' do
      @page.first_dropdown=@page.first_dropdown_options[0]
      expect(@page.first_dropdown).to include('Hologram')
    end

    it '- Hologram: Color Modal' do
      @page.edit_first_color_alt_element.click
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
  end

###### Fabric Option 2 ########
  context 'Area C: Fabric Option 2' do
    it '- Front Body Appliques Fabric: Nylon/Spandex with Foil' do
      @page.first_dropdown=@page.first_dropdown_options[1]
      expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Nylon/Spandex with Foil: Color Modal' do
      @page.edit_first_color_alt_element.click
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



  context 'Area C: Fabric Option 3' do

  	it '- Area C: Mesh Fabric Option' do
  		@page.first_dropdown=@page.first_dropdown_options[2]
  		expect(@page.first_dropdown).to include("Mesh")
  	end

    it '- Fabric Mesh: Color Modal' do
      @page.edit_first_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Fabric Mesh: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.first_modal_header)
      end
      expect(@arr.sort).to match_array($mesh_colors.sort)
    end

    it '- Fabric Mesh: Close Color Modal' do
      @page.first_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
      @page.first_dropdown=@page.first_dropdown_options[2]
    end
  end


    #####################
    ## Lining Option 1 ##
    #####################
  context 'Mesh: Lining Option 1' do
    it 'Lining Fabric: Hologram' do
      @page.second_dropdown=@page.second_dropdown_options[0]
      expect(@page.second_dropdown).to include('Hologram')
    end

    it '- Edit Lining Color' do
      @page.edit_second_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cycle Lining: Hologram Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.color_modal_header)
      end
      expect(@arr).to match_array($hologram_colors)
    end

    it '- Lining: Close Color Modal' do
      @page.second_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
      @page.first_dropdown=@page.first_dropdown_options[2]
    end
  end


    ############################
    ## Lining Option 2 ##
    ############################
  context 'Mesh: Lining Option 2' do
    it 'Lining Fabric: Nylon/Spandex' do
      @page.second_dropdown=@page.second_dropdown_options[1]
      expect(@page.second_dropdown).to include('Nylon/Spandex')
    end

    it '- Edit Lining Color' do
      @page.edit_second_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Cycle Lining: Nylon/Spandex Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.color_modal_header)
      end
      expect(@arr).to match_array($nylon_spandex_colors)
    end

    it '- Lining: Close Color Modal' do
      @page.second_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
      @page.first_dropdown=@page.first_dropdown_options[2]
    end
  end

    ############################
    ## Lining Option 3 ##
    ############################
  context 'Mesh: Lining Option 2' do
    it 'Lining Fabric: Nylon/Spandex with Foil' do
      @page.second_dropdown=@page.second_dropdown_options[2]
      expect(@page.second_dropdown).to include('Nylon/Spandex with Foil')
    end

    it '- Edit Lining Color' do
      @page.edit_second_color_element.click
      expect(@page.color_modal_popup?).to eq(true) 
    end

    it '- Cycle Lining: Nylon/Spandex with Foil Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.color_modal_header)
      end
      expect(@arr).to match_array($foil_colors)
    end

    it '- Lining: Close Color Modal' do
      @page.second_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
      @page.first_dropdown=@page.first_dropdown_options[2]
    end
  end

    ############################
    ## Lining Option 4 ##
    ############################
  context 'Mesh: Lining Option 4' do
    it 'Lining Fabric: Shadowproof Liner' do
      @page.second_dropdown=@page.second_dropdown_options[3]
      expect(@page.second_dropdown).to include('Shadowproof Liner')
    end

    it '- Edit Lining Color' do
      @page.edit_second_color_element.click
      expect(@page.color_modal_popup?).to eq(true) 
    end

    it '- Cycle Lining: Shadowproof Liner Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.color_modal_header)
      end
      expect(@arr).to match_array($shadowproof_colors)
    end

    it '- Lining: Close Color Modal' do
      @page.second_color_modal_close_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end













##################
#### GK Logo #####
##################


  context 'Design & Color Page: Embroidery GK Logo ' do

    it '- Expand GK Logo Accordian' do
      @page.fifth_accordian_element.click
      expect(@page.first_dropdown?).to eq(true)
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

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

  context 'Design & Color Page: Crystals GK Logo ' do

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
      expect(@arr.sort).to match_array($crystal_colors.sort)
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

    it '- Set 1 Option: J1276' do
      @page.single_option_two_element.click
      expect(@page.single_option_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 1 Option: T1421' do
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








  #########################
  ##        Set 2        ##
  #########################

  context 'Embellishments Page: Set 2' do

    it '- Set 2 Option: None' do
      @page.sub_accordian_two_element.click
      @page.single_option_one_element.click
      expect(@page.single_option_one_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 2 Option: T1422' do
      @page.single_option_two_element.click
      expect(@page.single_option_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 2 Option: T1423' do
      @page.single_option_three_element.click
      expect(@page.single_option_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 2 Option: T1425' do
      @page.single_option_three_element.click
      expect(@page.single_option_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 2 Option: T1425' do
      @page.single_option_four_element.click
      expect(@page.single_option_four_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 2 Color: Edit Color' do
      @page.edit_pos_one_color_element.click
      expect(@page.color_modal_popup?).to eq(true)
    end

    it '- Set 2 Color: Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_one)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Set 2 Color: Close Modal' do
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
      @page.sub_accordian_three_element.click
      expect(@page.multioption_one?).to eq(true)
    end
  end

  context 'Additional Designs: Option 1' do
    it '- Additional Designs Option: J14' do
      @page.multioption_one_element.click
      expect(@page.multioption_one_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J14 Edit Color' do
      @page.edit_pos_one_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J14 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_one)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J14 Color: Close Modal' do
      @page.embellishment_modal_close_one_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

  context 'Additional Designs: Option 2' do
    it '- Additional Designs Option: T1424' do
      @page.multioption_two_element.click
      expect(@page.multioption_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: T1424 Edit Color' do
      @page.multioption_two_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: T1424 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_two)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs T1424 Color: Close Modal' do
      @page.embellishment_modal_close_two_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

  context 'Additional Designs: Option 3' do
        it '- Additional Designs Option: J1275' do
      @page.multioption_three_element.click
      expect(@page.multioption_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J1275 Edit Color' do
      @page.multioption_three_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J1275 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_three)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J1275 Color: Close Modal' do
      @page.embellishment_modal_close_three_element.click
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
      @page.sub_accordian_four_element.click
      expect(@page.single_option_one?).to eq(true)     
    end

    it '- Cuff Designs Option: None' do
      @page.single_option_one_element.click
      expect(@page.single_option_one_element.attribute('class')).not_to include('select-none')
      expect(@page.single_option_one_element.text).to include("None")
    end

    it '- Cuff Designs Option: J250' do
      @page.single_option_two_element.click
      expect(@page.single_option_two_element.attribute('class')).not_to include('select-none')
      expect(@page.single_option_two_element.text).to include("J250")
    end

    it '- Cuff Designs Option: T249' do
      @page.single_option_three_element.click
      expect(@page.single_option_three_element.attribute('class')).not_to include('select-none')
      expect(@page.single_option_three_element.text).to include("T249")
    end

    it '- Cuff Designs Option: T728' do
      @page.single_option_four_element.click
      expect(@page.single_option_four_element.attribute('class')).not_to include('select-none')
      expect(@page.single_option_four_element.text).to include("T728")
    end

    it '- Cuff Designs Option: T860' do
      @page.single_option_five_element.click
      expect(@page.single_option_five_element.attribute('class')).not_to include('select-none')
      expect(@page.single_option_five_element.text).to include("T860")
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
      expect(@page.embellishment_modal_close_one?).to eq(false)
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











###########################
##  Lettering & Artwork  ##
###########################


context 'Embellishments Page: Lettering & Artwork' do
    
    it '- Expand Lettering & Artwork Accordian' do
      @page.second_accordian_element.click
      expect(@page.lettering_artwork_info?).to eq(true)
    end
  end


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




  #############################################################
  ##  Front Center Chest  #### Lettering ####    No Mesh     ##
  #############################################################

  context 'Embellishments Page: Front Center Chest Lettering' do
    
    it '- Front Center Chest: Lettering Radio' do
      @page.lettering_alt_element.click
      expect(@page.lettering_alt_element.set?).to eq(true)
    end


    it '- Lettering Embellishment Type Option: Small Embroidery' do
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


    it '- Lettering Embellishment Type Option: Large Embroidery' do
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

    it '- Lettering Embellishment Type Option: Imprinting' do
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

    it '- Lettering Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr).to eq($font_options)
    end

    it '- Lettering Options: One Line Position' do
      @page.position=@page.position_options[0]
      expect(@page.text_line_one?).to eq(true)
      expect(@page.position).to include("One Line")
    end

    it '- Lettering Options: Two Line Position' do
      @page.position=@page.position_options[1]
      expect(@page.text_line_two_alt?).to eq(true)
      expect(@page.position).to include("Two Line")
    end

    it '- Lettering Text Position: Curved Line' do
      @page.position=@page.position_options[2]
      expect(@page.text_line_two_alt?).not_to eq(true)
      expect(@page.position).to include("Curved")
    end

    it '- Lettering Options: Text Line 1' do
      @page.embellishment_type=@page.embellishment_type_options[0]
      @page.position=@page.position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Options: Text Line 2' do
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

#    it '- Front Center Chest: None Radio' do
#      @page.none_element.click
#      expect(@page.embellishment_type_element.present?).to eq(false)
#    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end




















  ###############################################################
  ##  Front Right Hip  #### Custom Artwork ####    No Mesh     ##
  ###############################################################


  context 'Embellishments Page: Front Right Hip Artwork' do

    it '- Lettering & Artwork: Expand Front Right Hip Accordian' do
      @page.sub_accordian_two_element.click
    end

    it '- Front Right Hip: Custom Artwork Radio' do
      @page.custom_art_pos_one_element.click
    end

    it '- Front Right Hip: Embellishment Types' do
      @page.embellishment_type_options.each do |x|
        @page.embellishment_type=x
        @arr.push(x)
      end
      expect(@arr.sort).to match_array($embellishment_types.sort)
    end

    it '- Front Right Hip: Upload File' do
      @page.upload_alt='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
    end

    it '- Front Right Hip: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Front Right Hip: Artwork Add Comment' do
      @page.art_comment_alt_element.send_keys 'This is a Test'
      expect(@page.art_comment_alt).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end




  ##########################################################
  ##  Front Right Hip  #### Lettering ####    No Mesh     ##
  ##########################################################

  context 'Embellishments Page: Front Right Hip Lettering' do
    
    it '- Front Right Hip: Lettering Radio' do
      @page.lettering_alt_element.click
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


    it '- Lettering Embellishment Type Non-Mesh Option: Imprinting' do
      @page.embellishment_type=@page.embellishment_type_options[1]
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

    it '- Lettering Non-Mesh Text Position: Curved Line' do
      @page.position=@page.position_options[1]
      expect(@page.text_line_two_alt?).not_to eq(true)
    end

    it '- Lettering Non-Mesh Options: Text Line 1' do
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Front Right Hip: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Front Right Hip: Lettering Add Comment' do
      @page.comment_element.send_keys 'This is a Test'
      expect(@page.comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end









  ###################
  ##  Left Sleeve  ##
  ###################  
  context 'Embellishments Page: Upper Left Sleeve' do
    it '- Lettering & Artwork: Expand Left Sleeve Accordian' do
      @page.sub_accordian_three_element.click
    end

    it '- Upper Left Sleeve: Upper Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[0]
    end
  end


  ###############################################################################
  ##  Left Sleeve  ####  Upper Sleeve  #### Custom Artwork ####    No Mesh     ##
  ############################################################################### 
  
  

  context 'Upper Left Sleeve: Custom Artwork' do
    it '- Upper Left Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
    end

    it '- Upper Left Sleeve: Embellishment Types' do
      @page.upper_embellishment_type_options.each do |x|
        @page.upper_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr).to match_array($embellishment_types)
    end

    it '- Upper Left Sleeve: Upload File' do
      @page.upload='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
    end

    it '- Upper Left Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Upper Left Sleeve: Artwork Add Comment' do
      @page.art_comment_alt_element.send_keys 'This is a Test'
      expect(@page.artwork_comment).to include("This is a Test")
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end


  ##########################################################################
  ##  Left Sleeve  ####  Upper Sleeve  #### Lettering ####    No Mesh     ##
  ##########################################################################


  context 'Upper Left Sleeve: Lettering' do
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
      expect(@arr).to match_array($imprinting_colors)
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
      expect(@arr).to match_array($embroidery_colors)
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
      expect(@arr).to eq($font_options)
    end

    it '- Lettering Options: Verify Orientation Options' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[0]
      expect(@page.lettering_orientation_options).to eq($orientation_upper)
    end

    it '- Lettering Orientation Options: Cycle Options' do
      @page.lettering_orientation_options.each do |x|
        @page.lettering_orientation=x
        @arr.push(x)
      end
      expect(@arr).to match_array($orientation_upper)
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
      @page.embellishment_type=@page.embellishment_type_options[0]
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

#    it '- Upper Left Sleeve: None Radio' do
#      @page.none_element.click
#      expect(@page.upper_embellishment_type_element.present?).to eq(false)
#    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end




  ###############################################################################
  ##  Left Sleeve  ####   Full Sleeve  #### Custom Artwork ####    No Mesh     ##
  ###############################################################################
  
  
  context 'Full Left Sleeve: Custom Art' do

    it '- Full Left Sleeve: Full Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[1]
    end

    it '- Full Left Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
    end

    it '- Full Left Sleeve: Embroidery Option' do
      @page.full_embellishment_type_options.each do |x|
        @page.full_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr).to match_array($embellishment_types)
    end

    it '- Full Left Sleeve: Upload File' do
      @page.upload_full='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
      expect(@page.uploading?).to eq(true)
    end

    it '- Full Left Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys(:home)
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Full Left Sleeve: Artwork Add Comment' do
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

    it '- Full Left Sleeve Lettering Color: Close Modal' do
      @page.close_full_letter_modal_element.click
      expect(@page.close_full_letter_modal?).not_to eq(true)
    end

    it '- Lettering Options: Verify Fonts' do
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

    it '- Lettering Options: Text Line 1' do
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















  ####################
  ##  Right Sleeve  ##
  #################### 


  context 'Embellishments Page: Upper Left Sleeve' do
    it '- Lettering & Artwork: Expand Right Sleeve Accordian' do
      @page.sub_accordian_four_element.click
    end

    it '- Right Sleeve: Upper Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[0]
      expect(@page.sleeve_location_dropdown).to include("Upper Sleeve")
    end
  end

  ################################################################################
  ##  Right Sleeve  ####  Upper Sleeve  #### Custom Artwork ####    No Mesh     ##
  ################################################################################

  context 'Upper Right Sleeve: Custom Art' do

    it '- Right Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
      expect(@page.custom_artwork_element.set?).to eq(true)
    end

    it '- Right Sleeve: Embellishment Types' do
      @page.upper_embellishment_type_options.each do |x|
        @page.upper_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr).to match_array($embellishment_types)
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

  context 'Upper Right Sleeve: Lettering' do
    it '- Right Sleeve: Lettering Radio' do
      @page.lettering_element.click
    end

    it '- Lettering Embellishment Types: Small Embroidery Colors' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[0]
      @page.lettering_color_element.click
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header)
      end
      expect(@arr).to match_array($embroidery_colors)
    end

    it '- Lettering: Close Modal' do
      @page.lettering_modal_close_element.click
      expect(@page.lettering_modal_close?).to eq(false)
    end

    it '- Lettering Embellishment Types: Imprinting Colors' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[1]
      @page.lettering_color_element.click
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.lettering_color_header)
      end
      expect(@arr).to match_array($imprinting_colors)
    end

    it '- Lettering Imprinting: Disable Two Line' do
      expect(@page.lettering_position_options).not_to include('Two Line')
    end

    it '- Lettering: Close Modal' do
      @page.lettering_modal_close_element.click
      expect(@page.lettering_modal_close?).to eq(false)
    end

    it '- Lettering Options: Fonts' do
      @page.font_dropdown_element.click
      @page.font_dropdown_list_elements.each do |x|
        x.click
        @page.font_dropdown_element.click
        @arr.push(@page.selected_font)
      end
      @page.font_dropdown_element.click
      expect(@arr).to eq($font_options)
    end

    it '- Lettering Options: Orientation' do
      @page.upper_embellishment_type=@page.upper_embellishment_type_options[0]
      @page.lettering_orientation_options.each do |x|
        @page.lettering_orientation=x
      end
      expect(@page.lettering_orientation_options).to eq($orientation_upper)
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
      @page.lettering_orientation=@page.lettering_orientation_options[0]
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
      @page.embellishment_type=@page.embellishment_type_options[0]
      @page.lettering_position=@page.lettering_position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Options: Text Line 2' do
      @page.text_line_two_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_two).to include('Test Test Test Test Test')
    end

    it '- Right Sleeve: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Right Sleeve: Lettering Add Comment' do
      @page.lettering_comment_element.send_keys 'This is a Test'
      expect(@page.lettering_comment).to include("This is a Test")
    end

    #    it '- Right Sleeve: None Radio' do
    #      @page.none_element.click
    #      expect(@page.embellishment_type_element.present?).to eq(false)
    #    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end














  ###############################################################################
  ##  Right Sleeve  ####  Full Sleeve  #### Custom Artwork ####    No Mesh     ##
  ###############################################################################


  context 'Full Left Sleeve: Custom Art' do

    it '- Full Left Sleeve: Full Sleeve' do
      @page.sleeve_location_dropdown=@page.sleeve_location_dropdown_options[1]
    end

    it '- Full Left Sleeve: Custom Artwork Radio' do
      @page.custom_artwork_element.click
    end

    it '- Full Left Sleeve: Embroidery Option' do
      @page.full_embellishment_type_options.each do |x|
        @page.full_embellishment_type=x
        @arr.push(x)
      end
      expect(@arr).to match_array($embellishment_types)
    end

    it '- Full Left Sleeve: Upload File' do
      @page.upload_full='C:\Users\cason.williams\Desktop\screenshots\Olympic-logo.png'
      @page.upload_button_element.click
      expect(@page.uploading?).to eq(true)
    end

    it '- Full Left Sleeve: Artwork Scale Slider' do
      @page.scale_slider_element.input.send_keys(:home)
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Full Left Sleeve: Artwork Add Comment' do
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

    it '- Imprinting Embellishment Type: Verify Colors' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.full_lettering_header)
      end
      expect(@arr).to match_array($imprinting_colors)
    end

    it '- Full Right Sleeve Lettering Color: Close Modal' do
      @page.close_full_letter_modal_element.click
      expect(@page.close_full_letter_modal?).not_to eq(true)
    end

    it '- Lettering Options: Verify Fonts' do
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

    it '- Lettering Options: Text Line 1' do
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





















  ##############################################################
  ##  Center Back  ####   Custom Artwork   ####    No Mesh    ##
  ##############################################################


  context 'Embellishments Page: Center Back Artwork' do

    it '- Lettering & Artwork: Expand Center Back Accordian' do
      @page.sub_accordian_five_element.click
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



  #########################################################
  ##  Center Back  ####   Lettering   ####    No Mesh    ##
  #########################################################


  context 'Embellishments Page: Center Back Lettering' do

    it '- Front Center Back: Lettering Radio' do
      @page.lettering_alt_element.click
      expect(@page.lettering_alt_element.set?).to eq(true)
    end


    it '- Lettering Embellishment Type Option: Small Embroidery' do
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


    it '- Lettering Embellishment Type Option: Large Embroidery' do
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

    it '- Lettering Embellishment Type Option: Imprinting' do
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

    it '- Lettering Options: Verify Fonts' do
      @page.font_dropdown_list_elements.each do |x|
        @page.font_dropdown_element.click
        x.click
        @arr.push(@page.font_dropdown)
      end
      expect(@arr).to eq($font_options)
    end

    it '- Lettering Options: One Line Position' do
      @page.position=@page.position_options[0]
      expect(@page.text_line_one?).to eq(true)
      expect(@page.position).to include("One Line")
    end

    it '- Lettering Options: Two Line Position' do
      @page.position=@page.position_options[1]
      expect(@page.text_line_two_alt?).to eq(true)
      expect(@page.position).to include("Two Line")
    end

    it '- Lettering Text Position: Curved Line' do
      @page.position=@page.position_options[2]
      expect(@page.text_line_two_alt?).not_to eq(true)
      expect(@page.position).to include("Curved")
    end

    it '- Lettering Options: Text Line 1' do
      @page.embellishment_type=@page.embellishment_type_options[0]
      @page.position=@page.position_options[1]
      @page.text_line_one_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_one).to include('Test Test Test Test Test')
    end

    it '- Lettering Options: Text Line 2' do
      @page.text_line_two_alt_element.send_keys 'Test Test Test Test Test Test Test'
      expect(@page.text_line_two_alt).to include('Test Test Test Test Test')
    end

    it '- Front Center Back: Lettering Scale Slider' do
      @page.scale_slider_element.input.send_keys :home
      expect(@page.scale_slider_element.input.value.to_i).to eq(0)
    end

    it '- Front Center Back: Lettering Add Comment' do
      @page.comment_element.send_keys 'This is a Test'
      expect(@page.comment).to include("This is a Test")
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