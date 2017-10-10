require './lib/pages/icon/uaf_clutchfit_men'


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - Validate JSON API Dataset: " do

	context 'Clutchfit Mens' do

		it 'Bottom Logo Color Logic' do
			expect($bottom_logo_left[:black]).to include('uaf-sel-color-white')
			expect($bottom_logo_left[:white]).to include('uaf-sel-color-black')
			expect($bottom_logo_left[:steel]).to include('uaf-sel-color-black')
			expect($bottom_logo_right[:black]).to include('uaf-sel-color-white')
			expect($bottom_logo_right[:white]).to include('uaf-sel-color-black')
			expect($bottom_logo_right[:steel]).to include('uaf-sel-color-black')
		end
	end
end

describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - GUI Logic Test" do

	before(:all) do
		BasePage.setup
	    $driver.goto('https://www.underarmour.com/en-us/pid3020925')
	    @page = ClutchfitMenAPI.new
	end
	
	context 'Right Shoe: Verify GUI UA Logo Color Logic' do

		it 'Purple Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_purple_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_purple_element.attribute('class')).to include('disabled')
		end

		it 'White Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_white_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_white_element.attribute('class')).to include('disabled')
		end

		it 'Black Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_black_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_black_element.attribute('class')).to include('disabled')
		end

		it 'Steel Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_steel_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_steel_element.attribute('class')).to include('disabled')
		end

		it 'Cardinal Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_cardinal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_cardinal_element.attribute('class')).to include('disabled')
		end
		it 'Red Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_red_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_red_element.attribute('class')).to include('disabled')
		end
		it 'Pink Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_pink_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_pink_element.attribute('class')).to include('disabled')
		end

		it 'Orange Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_orange_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_orange_element.attribute('class')).to include('disabled')
		end

		it 'Gold Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_gold_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_gold_element.attribute('class')).to include('disabled')
		end

		it 'Classic Green Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_green_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_green_element.attribute('class')).to include('disabled')
		end

		it 'Forest Green Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_forest_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_forest_element.attribute('class')).to include('disabled')
		end

		it 'Neptune Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_neptune_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_neptune_element.attribute('class')).to include('disabled')
		end

		it 'Carolina Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_carolina_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_carolina_element.attribute('class')).to include('disabled')
		end

		it 'Royal Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_royal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_royal_element.attribute('class')).to include('disabled')
		end

		it 'Navy Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_navy_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_navy_element.attribute('class')).to include('disabled')
		end
	end 

	context 'Left Shoe: Verify GUI UA Logo Color Logic' do

		it 'Purple Logo' do
			@page.change_foot
			@page.tab_upper_logo_element.click
			@page.logos_purple_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_purple_element.attribute('class')).to include('disabled')
		end

		it 'White Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_white_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_white_element.attribute('class')).to include('disabled')
		end

		it 'Black Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_black_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_black_element.attribute('class')).to include('disabled')
		end

		it 'Steel Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_steel_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_steel_element.attribute('class')).to include('disabled')
		end

		it 'Cardinal Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_cardinal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_cardinal_element.attribute('class')).to include('disabled')
		end
		it 'Red Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_red_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_red_element.attribute('class')).to include('disabled')
		end
		it 'Pink Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_pink_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_pink_element.attribute('class')).to include('disabled')
		end

		it 'Orange Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_orange_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_orange_element.attribute('class')).to include('disabled')
		end

		it 'Gold Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_gold_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_gold_element.attribute('class')).to include('disabled')
		end

		it 'Classic Green Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_green_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_green_element.attribute('class')).to include('disabled')
		end

		it 'Forest Green Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_forest_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_forest_element.attribute('class')).to include('disabled')
		end

		it 'Neptune Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_neptune_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_neptune_element.attribute('class')).to include('disabled')
		end

		it 'Carolina Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_carolina_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_carolina_element.attribute('class')).to include('disabled')
		end

		it 'Royal Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_royal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_royal_element.attribute('class')).to include('disabled')
		end

		it 'Navy Logo' do
			@page.tab_upper_logo_element.click
			@page.logos_navy_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_navy_element.attribute('class')).to include('disabled')
		end
	end 
end