require "./lib/pages/bmk/bmk_base_page"

describe "BMK Knife Generator" do

	before(:all) do
		@browser = BMKBasePage.new
		@hash = Hash.new
	end

	it "Price: Verified" do
		100.times do
			pair = @browser.random_knife
			expect(pair[1]).to include("#{pair[2]}")
			@hash.store(pair[0],pair[1])
			sleep 1
		end
		puts @hash
		@hash.each do |k,v|
			@response = BMKBasePage.bmk_saved_spec(k)
			@price = BMKBasePage.bmk_price(k)
			spec = @response.search('pre').text.scan(/(?<=\>)(.*?)(?=\<)/).flatten
			expect(spec[0]).not_to eq(nil)
			db_ids = "#{@response.search('p').text}"
			expect("#{db_ids.scan(/\d*[0-9]\d*/)}").not_to be_empty
			axis_lock = ['SILVER','BLACK']
			liner_color = ['SILVER','BLACK']
			hardware_color = ['SILVER','BLACK']
			edge = ['PLAIN EDGE','SERRATED']
			texture = ['HORIZONTAL RIDGE','VERTICAL RIDGE','CLASSIC']
			case 
			when spec[0].include?('CUSTOM GRIP')
				model = ['550','551','553','555','556','557']
				blade_steel = ['154CM','D2','S30V','N680','M4','20CV']
				blade_finish = ['SATIN','BLACK','DEEP-RED','HUNTER-ORANGE','TOXIC-GREEN','TITANIUM-BLUE','STEEL-GREY']
				handle_color = ['ROYAL BLUE','PURPLE','YELLOW','LIGHT PINK','LIGHT BLUE','BLACK','BLACK2','OLIVE DRAB','OLIVE DRAB2','SAND','ORANGE','WHITE','HOT PINK','NEON GREEN','CRIMSON RED','DESERT TAN','FOREST GREEN']
				clip_style = ['SATIN DEEP CARRY','BLACK OXIDE','SPLIT ARROW SILVER','SPLIT ARROW BLACK','BLACK OX DEEP CARRY','NO CLIP']
				handle_material = ['G10','NYLON']
				barrelspacer = ['SILVER','BLACK','NONE']
			when spec[0].include?('CUSTOM BRGE')
				model = ['580','583','585']
				blade_steel = ['154CM','D2','S30V','N680','M4','20CV']
				blade_finish = ['SATIN','BLACK','TITANIUM-BLUE','DEEP-RED','TOXIC-GREEN','HUNTER-ORANGE','SLATE-GREY','OLIVE-DRAB','DARK-EARTH','STEEL-GREY']
				handle_color = ['ROYAL BLUE','PURPLE','YELLOW','LIGHT PINK','LIGHT BLUE','BLACK','OLIVE DRAB','SAND','ORANGE','WHITE','HOT PINK','NEON GREEN','DARK GRAY','CRIMSON RED','KELLY GREEN','DESERT TAN','FOREST GREEN']
				clip_style = ['SATIN DEEP CARRY','BLACK OXIDE','SPLIT ARROW SILVER','SPLIT ARROW BLACK','BLACK OX DEEP CARRY','NO CLIP']
				backspacer = ['ROYAL BLUE','PURPLE','YELLOW','BLACK','LIGHT PINK','LIGHT BLUE','OLIVE DRAB','SAND','ORANGE','WHITE','HOT PINK','NEON GREEN','DARK GRAY','CRIMSON RED']
				handle_material = ['G10','NYLON']
			when spec[0].include?('CUSTOM CRKD RVR')
				model = '15080'
				blade_steel = ['D2','S30V','20CV']
				blade_finish = ['BLACK','SATIN']
				handle_material = ['G10','WOOD']
				handle_color = ['BLACK','DESERT TAN','GREY','RED','WOOD']
				pivot_brushing = ['SATIN','BLACK','BRASS','ORANGE','RED']
				bolster = ['BLACK','GREY']
				clip_style = ['SATIN DEEP CARRY','BLACK OXIDE','SPLIT ARROW SILVER','SPLIT ARROW BLACK OX','BLACK OX DEEP CARRY','NO CLIP']
				backspacer = ['BLACK','DESERT TAN','GREY','ORANGE','RED']
			end
			if spec[0].include?('CUSTOM GRIP')
				expect(model).to include(spec[1])
				expect(blade_steel).to include(spec[2])
				expect(blade_finish).to include(spec[3].upcase)
				expect(edge).to include(spec[4].upcase)
				expect(handle_color).to include(spec[5].upcase)
				expect(handle_color).to include(spec[6].upcase)
				expect(axis_lock).to include(spec[7].upcase)
				expect(liner_color).to include(spec[8].upcase)
				expect(hardware_color).to include(spec[9].upcase)
				expect(clip_style).to include(spec[10].upcase)
				expect(handle_material).to include(spec[11].upcase)
				expect(barrelspacer).to include(spec[12].upcase)
				expect(texture).to include(spec[13].upcase)
				expect(spec[14]).to include(v)
			end
			if spec[0].include?('CUSTOM BRGE')
				expect(model).to include(spec[1])
				expect(blade_steel).to include(spec[2])
				expect(blade_finish).to include(spec[3].upcase)
				expect(edge).to include(spec[4].upcase)
				expect(handle_color).to include(spec[5].upcase)
				expect(handle_color).to include(spec[6].upcase)
				expect(axis_lock).to include(spec[7].upcase)
				expect(liner_color).to include(spec[8].upcase)
				expect(hardware_color).to include(spec[9].upcase)
				expect(clip_style).to include(spec[10].upcase)
				expect(backspacer).to include(spec[11].upcase)
				expect(handle_material).to include(spec[12].upcase)
				expect(texture).to include(spec[13].upcase)
				expect(spec[14]).to include(v)
			end
			if spec[0].include?('CUSTOM CRKD RVR')
				expect('15080').to eq(spec[1])
				expect(blade_steel).to include(spec[2])
				expect(blade_finish).to include(spec[3].upcase)
				expect(handle_color).to include(spec[4].upcase)
				expect(handle_color).to include(spec[5].upcase)
				expect(axis_lock).to include(spec[6].upcase)
				expect(liner_color).to include(spec[7].upcase)
				expect(hardware_color).to include(spec[8].upcase)
				expect(clip_style).to include(spec[9].upcase)
				expect(backspacer).to include(spec[10].upcase)
				expect(handle_material).to include(spec[11].upcase)
				expect(pivot_brushing).to include(spec[12].upcase)
				expect(bolster).to include(spec[13].upcase)	
				expect(spec[14]).to include(v)			
			end
			expect(@price['contents'].empty?).to eq(false)
		end
	end
end