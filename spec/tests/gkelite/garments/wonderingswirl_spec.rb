require './lib/pages/gkelite/customizer_page'

describe "< #7605: Women's Wondering Swirl Gymnastics Leotard - Customizer Unit Test >" do

	before(:all) do
    BasePage.setup
		@page = CustomizerPage.new
		@page.wonderingswirl
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
  		expect(@page.long_sleeve_selected?).to eq(true)
  	end

  	it '- Set 3/4 Sleeve' do
  		@page.wait_until { @page.three_quarter? }
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





  ###### Fabric Option 3 ########

  context 'Area A: Fabric Option 3' do
  	it '- Fabric: Mesh' do
  		@page.first_dropdown=@page.first_dropdown_options[2]
  		expect(@page.first_dropdown).to include('Mesh')
  	end

  	it '- Mesh: Color Modal' do
  		@page.edit_first_color_element.click
  		expect(@page.color_modal_popup?).to eq(true)
  	end

  	it '- Cycle Mesh Colors' do
  		@page.color_grid_elements.each do |x|
  			x.click
  			@arr.push(@page.first_modal_header)
  		end
  		expect(@arr).to match_array($mesh_colors)
  	end

  	it '- Close Color Modal' do
  		@page.first_color_modal_close_element.click
  		expect(@page.first_modal_header?).to eq(false)
  	end

  	it ':::::::::CLEARING DATA:::::::::::' do
  		@page.start_over_element.click
  		@page.first_dropdown=@page.first_dropdown_options[2]
  	end
  end




    ############################
    ## Bodice Lining Option 1 ##
    ############################
    context 'Mesh: Bodice Lining Option 1' do
    	it 'Bodice Lining Fabric: Hologram' do
    		@page.second_dropdown=@page.second_dropdown_options[0]
    		expect(@page.second_dropdown).to include('Hologram')
    	end

    	it '- Edit Bodice Lining Color' do
    		@page.edit_second_color_element.click
    		expect(@page.color_modal_popup?).to eq(true)
    	end

    	it '- Cycle Bodice Lining: Hologram Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.color_modal_header)
    		end
    		expect(@arr).to match_array($hologram_colors)
    	end

    	it '- Bodice Lining: Close Color Modal' do
    		@page.second_color_modal_close_element.click
    		expect(@page.color_modal_popup?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end


    ############################
    ## Bodice Lining Option 2 ##
    ############################
    context 'Mesh: Bodice Lining Option 2' do
    	it 'Bodice Lining Fabric: Nylon/Spandex' do
    		@page.second_dropdown=@page.second_dropdown_options[1]
    		expect(@page.second_dropdown).to include('Nylon/Spandex')
    	end

    	it '- Edit Bodice Lining Color' do
    		@page.edit_second_color_element.click
    		expect(@page.color_modal_popup?).to eq(true)
    	end

    	it '- Cycle Bodice Lining: Nylon/Spandex Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.color_modal_header)
    		end
    		expect(@arr).to match_array($nylon_spandex_colors)
    	end

    	it '- Bodice Lining: Close Color Modal' do
    		@page.second_color_modal_close_element.click
    		expect(@page.color_modal_popup?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end

    ############################
    ## Bodice Lining Option 2 ##
    ############################
    context 'Mesh: Bodice Lining Option 2' do
    	it 'Bodice Lining Fabric: Nylon/Spandex with Foil' do
    		@page.second_dropdown=@page.second_dropdown_options[2]
    		expect(@page.second_dropdown).to include('Nylon/Spandex with Foil')
    	end

    	it '- Edit Bodice Lining Color' do
    		@page.edit_second_color_element.click
    		expect(@page.color_modal_popup?).to eq(true) 
    	end

    	it '- Cycle Bodice Lining: Nylon/Spandex with Foil Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.color_modal_header)
    		end
    		expect(@arr).to match_array($foil_colors)
    	end

    	it '- Bodice Lining: Close Color Modal' do
    		@page.second_color_modal_close_element.click
    		expect(@page.color_modal_popup?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end

    ############################
    ## Bodice Lining Option 4 ##
    ############################
    context 'Mesh: Bodice Lining Option 4' do
    	it 'Bodice Lining Fabric: Shadowproof Liner' do
    		@page.second_dropdown=@page.second_dropdown_options[3]
    		expect(@page.second_dropdown).to include('Shadowproof Liner')
    	end

    	it '- Edit Bodice Lining Color' do
    		@page.edit_second_color_element.click
    		expect(@page.color_modal_popup?).to eq(true) 
    	end

    	it '- Cycle Bodice Lining: Shadowproof Liner Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.color_modal_header)
    		end
    		expect(@arr).to match_array($shadowproof_colors)
    	end

    	it '- Bodice Lining: Close Color Modal' do
    		@page.second_color_modal_close_element.click
    		expect(@page.color_modal_popup?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end


    ############################
    ## Sleeve Lining Option 1 ##
    ############################

    context 'Mesh: Sleeve Lining Option 1' do
    	it 'Sleeve Lining Fabric: Hologram' do
    		@page.third_dropdown=@page.third_dropdown_options[0]
    		expect(@page.third_dropdown).to include('Hologram')
    	end

    	it '- Edit Sleeve Lining Color' do
    		@page.edit_third_color_element.click
    		expect(@page.third_modal_header_element.present?).to eq(true)
    	end

    	it '- Cycle Sleeve Lining: Hologram Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.third_modal_header)
    		end
    		expect(@arr).to match_array($hologram_colors)
    	end

    	it '- Sleeve Lining: Close Color Modal' do
    		@page.third_modal_close_element.click
    		expect(@page.third_modal_header_element.present?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end

    ############################
    ## Sleeve Lining Option 2 ##
    ############################
    context 'Mesh: Sleeve Lining Option 2' do
    	it 'Sleeve Lining Fabric Nylon/Spandex with Foil' do
    		@page.third_dropdown=@page.third_dropdown_options[1]
    		expect(@page.third_dropdown).to include('Nylon/Spandex with Foil')
    	end

    	it '- Edit Sleeve Lining Color' do
    		@page.edit_third_color_element.click
    		expect(@page.third_modal_header_element.present?).to eq(true)
    	end

    	it '- Cycle Sleeve Lining Nylon/Spandex with Foil Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.third_modal_header)
    		end
    		expect(@arr).to match_array($foil_colors)
    	end

    	it '- Sleeve Lining: Close Color Modal' do
    		@page.third_modal_close_element.click
    		expect(@page.third_modal_header_element.present?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end

    ############################
    ## Sleeve Lining Option 3 ##
    ############################
    context 'Mesh: Sleeve Lining Option 2' do
    	it 'Sleeve Lining Fabric Shadowproof Liner' do
    		@page.third_dropdown=@page.third_dropdown_options[2]
    		expect(@page.third_dropdown).to include('Shadowproof Liner')
    	end

    	it '- Edit Sleeve Lining Color' do
    		@page.edit_third_color_element.click
    		expect(@page.third_modal_header_element.present?).to eq(true)
    	end

    	it '- Cycle Sleeve Lining Shadowproof Liner Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.third_modal_header)
    		end
    		expect(@arr).to match_array($shadowproof_colors)
    	end

    	it '- Sleeve Lining: Close Color Modal' do
    		@page.third_modal_close_element.click
    		expect(@page.third_modal_header_element.present?).to eq(false)
    	end

    	it ':::::::::CLEARING DATA:::::::::::' do
    		@page.start_over_element.click
    		@page.first_dropdown=@page.first_dropdown_options[2]
    	end
    end

    ############################
    ## Sleeve Lining Option 4 ##
    ############################
    context 'Mesh: Sleeve Lining Option 4' do
    	it 'Sleeve Lining Fabric: Nylon/Spandex' do
    		@page.third_dropdown=@page.third_dropdown_options[3]
    		expect(@page.third_dropdown).to include('Nylon/Spandex')
    	end

    	it '- Edit Sleeve Lining Color' do
    		@page.edit_third_color_element.click
    		expect(@page.third_modal_header_element.present?).to eq(true)
    	end

    	it '- Cycle Sleeve Lining Nylon/Spandex Colors' do
    		@page.color_grid_elements.each do |x|
    			x.click
    			@arr.push(@page.third_modal_header)
    		end
    		expect(@arr).to match_array($nylon_spandex_colors)
    	end

    	it '- Sleeve Lining: Close Color Modal' do
    		@page.third_modal_close_element.click
    		expect(@page.third_modal_header_element.present?).to eq(false)
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
end

###### Fabric Option 1 ########
context 'Area B: Fabric Option 1' do
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
end

###### Fabric Option 2 ########
context 'Area B: Fabric Option 2' do
	it '- Lower Body & Scrunchie Fabric: Nylon/Spandex with Foil' do
		@page.first_dropdown=@page.first_dropdown_options[1]
		expect(@page.first_dropdown).to include('Nylon/Spandex with Foil')
	end

	it '- Nylon/Spandex with Foil: Color Modal' do
		@page.edit_gradient_element.click
		expect(@page.gradient_modal_popup?).to eq(true)
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




######################
##### AREA B ALT #####
######################


context 'Design & Color Page: Area B' do
	it '- Expand Area B Accordian' do
		@page.second_accordian_element.click
		@page.first_dropdown=@page.first_dropdown_options[2]
		@page.third_accordian_element.click
		expect(@page.edit_gradient?).to eq(true)
	end
end

###### Fabric Option 1 ########
context 'Area B ALT: Fabric Option 1' do

	it 'Sublimation on Holotek: Open Gradient Modal' do
		@page.edit_gradient_element.click
		expect(@page.gradient_modal_popup?).to eq(true)
	end

	it '- Fabric Sublimation on Holotek: Set 3-Color Colorcount' do
		@page.colorcount_dropdown=@page.colorcount_dropdown_options[0]
		@page.color_combo_dropdown=@page.color_combo_dropdown_options[0]
		expect(@page.colorcount_dropdown).to include('3-Color')
	end

	it '- Fabric Sublimation on Holotek: Pink Combo Options' do
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












##################
##### AREA D #####
##################


context 'Design & Color Page: Area D' do

	it '- Expand Area D Accordian' do
		@page.fifth_accordian_element.click
		expect(@page.edit_first_color_alt?).to eq(true)
	end
end


###### Fabric Option 1 ########

context 'Area D: Fabric Option 1' do
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

context 'Area D: Fabric Option 2' do
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

















  ##################
  ##### AREA 1 #####
  ##################


  context 'Design & Color Page: Area 1' do

    it '- Expand Area 1 Accordian' do
      @page.sixth_accordian_element.click
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

    it '- Set 1 Option: T1152' do
      @page.single_option_two_element.click
      expect(@page.single_option_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Set 1 Option: T1153' do
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
    it '- Additional Designs Option: J1140' do
      @page.multioption_two_element.click
      expect(@page.multioption_two_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J1140 Edit Color' do
      @page.multioption_two_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J1140 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_two)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J1140 Color: Close Modal' do
      @page.embellishment_modal_close_two_element.click
      expect(@page.color_modal_popup?).to eq(false)
    end

    it ':::::::::CLEARING DATA:::::::::::' do
      @page.start_over_element.click
    end
  end

  context 'Additional Designs: Option 3' do
        it '- Additional Designs Option: J1141' do
      @page.multioption_three_element.click
      expect(@page.multioption_three_element.attribute('class')).not_to include('select-none')
    end

    it '- Additional Designs Option: J1141 Edit Color' do
      @page.multioption_three_color_element.click
      expect(@page.color_modal_popup?).to eq(true)      
    end

    it '- Additional Designs Option: J1141 Color Options' do
      @page.color_grid_elements.each do |x|
        x.click
        @arr.push(@page.embellishment_modal_header_three)
      end
      expect(@arr).to match_array($crystal_colors)
    end

    it '- Additional Designs J1141 Color: Close Modal' do
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
      @page.alt_accordian_element.click
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
end