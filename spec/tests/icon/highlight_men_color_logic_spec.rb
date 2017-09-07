require 'json'
require 'net/http'
require './lib/pages/icon/uaf_highlight_men'


describe "#{ENV[SITE]}:#{ENV[ENVIRONMENT]}:#{ENV[BROWSER]} - Validate JSON API Dataset: " do

	context "Validate Highlight Men's API Dataset" do

		it 'Tongue Collar Lining Color Logic' do
			expect($collar_left_color[:black]).to include('uaf-sel-color-black')
			expect($collar_left_color[:white]).to include('uaf-sel-color-white')
			expect($collar_left_color[:steel]).to include('uaf-sel-color-steel')
			expect($collar_right_color[:black]).to include('uaf-sel-color-black')
			expect($collar_right_color[:white]).to include('uaf-sel-color-white')
			expect($collar_right_color[:steel]).to include('uaf-sel-color-steel')
		end

		it 'Tongue Logo Color Logic' do
			expect($tongue_logo_left[:white]).to include('uaf-sel-color-white')
			expect($tongue_logo_left[:black]).to include('uaf-sel-color-black')
			expect($tongue_logo_left[:steel]).to include('uaf-sel-color-steel')
			expect($tongue_logo_left[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($tongue_logo_left[:red]).to include('uaf-sel-color-red')
			expect($tongue_logo_left[:pink]).to include('uaf-sel-color-tropic-pink')
			expect($tongue_logo_left[:orange]).to include('uaf-sel-color-team-orange')
			expect($tongue_logo_left[:gold]).to include('uaf-sel-color-steeltown-gold')
			expect($tongue_logo_left[:kelly]).to include('uaf-sel-color-team-kelly-green')
			expect($tongue_logo_left[:forest]).to include('uaf-sel-color-forest-green')
			expect($tongue_logo_left[:neptune]).to include('uaf-sel-color-neptune')
			expect($tongue_logo_left[:carolina]).to include('uaf-sel-color-carolina-blue')
			expect($tongue_logo_left[:royal]).to include('uaf-sel-color-team-royal')
			expect($tongue_logo_left[:navy]).to include('uaf-sel-color-midnight-navy')
			expect($tongue_logo_left[:purple]).to include('uaf-sel-color-purple')
			expect($tongue_logo_right[:white]).to include('uaf-sel-color-white')
			expect($tongue_logo_right[:black]).to include('uaf-sel-color-black')
			expect($tongue_logo_right[:steel]).to include('uaf-sel-color-steel')
			expect($tongue_logo_right[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($tongue_logo_right[:red]).to include('uaf-sel-color-red')
			expect($tongue_logo_right[:pink]).to include('uaf-sel-color-tropic-pink')
			expect($tongue_logo_right[:orange]).to include('uaf-sel-color-team-orange')
			expect($tongue_logo_right[:gold]).to include('uaf-sel-color-steeltown-gold')
			expect($tongue_logo_right[:kelly]).to include('uaf-sel-color-team-kelly-green')
			expect($tongue_logo_right[:forest]).to include('uaf-sel-color-forest-green')
			expect($tongue_logo_right[:neptune]).to include('uaf-sel-color-neptune')
			expect($tongue_logo_right[:carolina]).to include('uaf-sel-color-carolina-blue')
			expect($tongue_logo_right[:royal]).to include('uaf-sel-color-team-royal')
			expect($tongue_logo_right[:navy]).to include('uaf-sel-color-midnight-navy')
			expect($tongue_logo_right[:purple]).to include('uaf-sel-color-purple')
		end
	end
end

describe "#{ENV[SITE]}:#{ENV[ENVIRONMENT]}:#{ENV[BROWSER]} - GUI Logic Test" do

	before(:all) do
	    BasePage.resize_window
	    $driver.goto('https://www.underarmour.com/en-us/pid3020924')
	    @page = HighlightMenAPI.new
	end

	context 'Right Shoe: Verify UA Logo Color Logic' do

		it 'Purple Logo' do
			@page.tab_logos_element.click
			@page.logos_purple_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_purple_element.attribute('class')).to include('disabled')
		end

		it 'White Logo' do
			@page.tab_logos_element.click
			@page.logos_white_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_white_element.attribute('class')).to include('disabled')
		end

		it 'Black Logo' do
			@page.tab_logos_element.click
			@page.logos_black_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_black_element.attribute('class')).to include('disabled')
		end

		it 'Steel Logo' do
			@page.tab_logos_element.click
			@page.logos_steel_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_steel_element.attribute('class')).to include('disabled')
		end

		it 'Cardinal Logo' do
			@page.tab_logos_element.click
			@page.logos_cardinal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_cardinal_element.attribute('class')).to include('disabled')
		end
		it 'Red Logo' do
			@page.tab_logos_element.click
			@page.logos_red_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_red_element.attribute('class')).to include('disabled')
		end
		it 'Pink Logo' do
			@page.tab_logos_element.click
			@page.logos_pink_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_pink_element.attribute('class')).to include('disabled')
		end

		it 'Orange Logo' do
			@page.tab_logos_element.click
			@page.logos_orange_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_orange_element.attribute('class')).to include('disabled')
		end

		it 'Gold Logo' do
			@page.tab_logos_element.click
			@page.logos_gold_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_gold_element.attribute('class')).to include('disabled')
		end

		it 'Kelly Green Logo' do
			@page.tab_logos_element.click
			@page.logos_kelly_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_kelly_element.attribute('class')).to include('disabled')
		end

		it 'Forest Green Logo' do
			@page.tab_logos_element.click
			@page.logos_forest_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_forest_element.attribute('class')).to include('disabled')
		end

		it 'Neptune Logo' do
			@page.tab_logos_element.click
			@page.logos_neptune_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_neptune_element.attribute('class')).to include('disabled')
		end

		it 'Carolina Logo' do
			@page.tab_logos_element.click
			@page.logos_carolina_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_carolina_element.attribute('class')).to include('disabled')
		end

		it 'Royal Logo' do
			@page.tab_logos_element.click
			@page.logos_royal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_royal_element.attribute('class')).to include('disabled')
		end

		it 'Navy Logo' do
			@page.tab_logos_element.click
			@page.logos_navy_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_navy_element.attribute('class')).to include('disabled')
		end
	end 

	context 'Left Shoe: Verify UA Logo Color Logic' do

		it 'Purple Logo' do
			@page.change_foot
			@page.tab_logos_element.click
			@page.logos_purple_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_purple_element.attribute('class')).to include('disabled')
		end

		it 'White Logo' do
			@page.tab_logos_element.click
			@page.logos_white_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_white_element.attribute('class')).to include('disabled')
		end

		it 'Black Logo' do
			@page.tab_logos_element.click
			@page.logos_black_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_black_element.attribute('class')).to include('disabled')
		end

		it 'Steel Logo' do
			@page.tab_logos_element.click
			@page.logos_steel_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_steel_element.attribute('class')).to include('disabled')
		end

		it 'Cardinal Logo' do
			@page.tab_logos_element.click
			@page.logos_cardinal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_cardinal_element.attribute('class')).to include('disabled')
		end
		it 'Red Logo' do
			@page.tab_logos_element.click
			@page.logos_red_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_red_element.attribute('class')).to include('disabled')
		end
		it 'Pink Logo' do
			@page.tab_logos_element.click
			@page.logos_pink_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_pink_element.attribute('class')).to include('disabled')
		end

		it 'Orange Logo' do
			@page.tab_logos_element.click
			@page.logos_orange_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_orange_element.attribute('class')).to include('disabled')
		end

		it 'Gold Logo' do
			@page.tab_logos_element.click
			@page.logos_gold_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_gold_element.attribute('class')).to include('disabled')
		end

		it 'Kelly Green Logo' do
			@page.tab_logos_element.click
			@page.logos_kelly_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_kelly_element.attribute('class')).to include('disabled')
		end

		it 'Forest Green Logo' do
			@page.tab_logos_element.click
			@page.logos_forest_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_forest_element.attribute('class')).to include('disabled')
		end

		it 'Neptune Logo' do
			@page.tab_logos_element.click
			@page.logos_neptune_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_neptune_element.attribute('class')).to include('disabled')
		end

		it 'Carolina Logo' do
			@page.tab_logos_element.click
			@page.logos_carolina_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_carolina_element.attribute('class')).to include('disabled')
		end

		it 'Royal Logo' do
			@page.tab_logos_element.click
			@page.logos_royal_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_royal_element.attribute('class')).to include('disabled')
		end

		it 'Navy Logo' do
			@page.tab_logos_element.click
			@page.logos_navy_element.click
			@page.tab_logo_outline_element.click
			expect(@page.outline_navy_element.attribute('class')).to include('disabled')
		end
	end 
end