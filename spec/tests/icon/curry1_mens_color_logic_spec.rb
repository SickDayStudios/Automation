require 'json'
require 'net/http'
require './lib/pages/icon/uaf_curry1_men'


describe "#{ENV['SITE'].upcase}:#{ENV['ENVIRONMENT'].upcase}:#{ENV['BROWSER'].upcase} - Validate JSON API Dataset: " do

	context 'Curry Mens' do

		it 'Charged Logo Color Logic' do
			expect($midsole_left_color[:black]).to include('uaf-sel-color-white')
			expect($midsole_left_color[:white]).to include('uaf-sel-color-steel')
			expect($midsole_left_color[:steel]).to include('uaf-sel-color-white')
			expect($midsole_left_color[:midnight]).to include('uaf-sel-color-white')
			expect($midsole_left_color[:red]).to include('uaf-sel-color-white')
			expect($midsole_left_color[:taxi]).to include('uaf-sel-color-black')
			expect($midsole_left_color[:royal]).to include('uaf-sel-color-white')
			expect($midsole_left_color[:gold]).to include('uaf-sel-color-black')
			expect($midsole_left_color[:silver]).to include('uaf-sel-color-white')
			expect($midsole_left_color[:fire]).to include('uaf-sel-color-black')
			expect($midsole_left_color[:neptune]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:black]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:white]).to include('uaf-sel-color-steel')
			expect($midsole_right_color[:steel]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:midnight]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:red]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:taxi]).to include('uaf-sel-color-black')
			expect($midsole_right_color[:royal]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:gold]).to include('uaf-sel-color-black')
			expect($midsole_right_color[:silver]).to include('uaf-sel-color-white')
			expect($midsole_right_color[:fire]).to include('uaf-sel-color-black')
			expect($midsole_right_color[:neptune]).to include('uaf-sel-color-white')
		end

		it 'Outsole Color Logic' do
			expect($outsole_left_color[:black]).to include('uaf-sel-color-white')
			expect($outsole_left_color[:white]).to include('uaf-sel-color-steel')
			expect($outsole_left_color[:steel]).to include('uaf-sel-color-white')
			expect($outsole_left_color[:blue]).to include('uaf-sel-color-white')
			expect($outsole_left_color[:gum]).to include('uaf-sel-color-gum-rubber')
			expect($outsole_right_color[:black]).to include('uaf-sel-color-white')
			expect($outsole_right_color[:white]).to include('uaf-sel-color-steel')
			expect($outsole_right_color[:steel]).to include('uaf-sel-color-white')
			expect($outsole_right_color[:blue]).to include('uaf-sel-color-white')
			expect($outsole_right_color[:gum]).to include('uaf-sel-color-gum-rubber')
		end

		it 'Outsole Line Color Logic' do
			expect($line_left_color[:black]).to include('uaf-sel-color-white')
			expect($line_left_color[:white]).to include('uaf-sel-color-steel')
			expect($line_left_color[:steel]).to include('uaf-sel-color-white')
			expect($line_left_color[:blue]).to include('uaf-sel-color-white')
			expect($line_left_color[:gum]).to include('uaf-sel-color-gum-rubber')
			expect($line_right_color[:black]).to include('uaf-sel-color-white')
			expect($line_right_color[:white]).to include('uaf-sel-color-steel')
			expect($line_right_color[:steel]).to include('uaf-sel-color-white')
			expect($line_right_color[:blue]).to include('uaf-sel-color-white')
			expect($line_right_color[:gum]).to include('uaf-sel-color-gum-rubber')
		end

		it 'Eyelets Color Logic' do
			expect($eyelet_left_color[:white]).to include('uaf-sel-color-white')
			expect($eyelet_left_color[:steel]).to include('uaf-sel-color-steel')
			expect($eyelet_left_color[:black]).to include('uaf-sel-color-black')
			expect($eyelet_left_color[:midnight]).to include('uaf-sel-color-midnight-navy')
			expect($eyelet_left_color[:royal]).to include('uaf-sel-color-team-royal-component')
			expect($eyelet_left_color[:taxi]).to include('uaf-sel-color-taxi')
			expect($eyelet_left_color[:red]).to include('uaf-sel-color-red')
			expect($eyelet_left_color[:blue]).to include('uaf-sel-color-carolina-blue')
			expect($eyelet_left_color[:neptune]).to include('uaf-sel-color-neptune')
			expect($eyelet_left_color[:maroon]).to include('uaf-sel-color-maroon')
			expect($eyelet_left_color[:orange]).to include('uaf-sel-color-team-orange')
			expect($eyelet_left_color[:purple]).to include('uaf-sel-color-purple')
			expect($eyelet_left_color[:fire]).to include('uaf-sel-color-phoenix-fire')
			expect($eyelet_left_color[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($eyelet_right_color[:white]).to include('uaf-sel-color-white')
			expect($eyelet_right_color[:steel]).to include('uaf-sel-color-steel')
			expect($eyelet_right_color[:black]).to include('uaf-sel-color-black')
			expect($eyelet_right_color[:midnight]).to include('uaf-sel-color-midnight-navy')
			expect($eyelet_right_color[:royal]).to include('uaf-sel-color-team-royal-component')
			expect($eyelet_right_color[:taxi]).to include('uaf-sel-color-taxi')
			expect($eyelet_right_color[:red]).to include('uaf-sel-color-red')
			expect($eyelet_right_color[:blue]).to include('uaf-sel-color-carolina-blue')
			expect($eyelet_right_color[:neptune]).to include('uaf-sel-color-neptune')
			expect($eyelet_right_color[:maroon]).to include('uaf-sel-color-maroon')
			expect($eyelet_right_color[:orange]).to include('uaf-sel-color-team-orange')
			expect($eyelet_right_color[:purple]).to include('uaf-sel-color-purple')
			expect($eyelet_right_color[:fire]).to include('uaf-sel-color-phoenix-fire')
			expect($eyelet_right_color[:cardinal]).to include('uaf-sel-color-cardinal')
		end

		it 'Tongue Loop Color Logic' do
			expect($loop_left_color[:white]).to include('uaf-sel-color-white')
			expect($loop_left_color[:black]).to include('uaf-sel-color-black')
			expect($loop_left_color[:steel]).to include('uaf-sel-color-steel')
			expect($loop_left_color[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($loop_left_color[:red]).to include('uaf-sel-color-red')
			expect($loop_left_color[:taxi]).to include('uaf-sel-color-taxi')
			expect($loop_left_color[:green]).to include('uaf-sel-color-forest-green')
			expect($loop_left_color[:blue]).to include('uaf-sel-color-carolina-blue')
			expect($loop_left_color[:royal]).to include('uaf-sel-color-team-royal-component')
			expect($loop_left_color[:midnight]).to include('uaf-sel-color-midnight-navy')
			expect($loop_right_color[:white]).to include('uaf-sel-color-white')
			expect($loop_right_color[:black]).to include('uaf-sel-color-black')
			expect($loop_right_color[:steel]).to include('uaf-sel-color-steel')
			expect($loop_right_color[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($loop_right_color[:red]).to include('uaf-sel-color-red')
			expect($loop_right_color[:taxi]).to include('uaf-sel-color-taxi')
			expect($loop_right_color[:green]).to include('uaf-sel-color-forest-green')
			expect($loop_right_color[:blue]).to include('uaf-sel-color-carolina-blue')
			expect($loop_right_color[:royal]).to include('uaf-sel-color-team-royal-component')
			expect($loop_right_color[:midnight]).to include('uaf-sel-color-midnight-navy')
		end

		it 'SC Logo Color Logic' do
			expect($sc_left_color[:white]).to include('uaf-sel-color-white')
			expect($sc_left_color[:black]).to include('uaf-sel-color-black')
			expect($sc_left_color[:silver]).to include('uaf-sel-color-metallic-silver')
			expect($sc_left_color[:gold]).to include('uaf-sel-color-metallic-gold')
			expect($sc_left_color[:steel]).to include('uaf-sel-color-steel')
			expect($sc_left_color[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($sc_left_color[:red]).to include('uaf-sel-color-red')
			expect($sc_left_color[:fire]).to include('uaf-sel-color-phoenix-fire')
			expect($sc_left_color[:orange]).to include('uaf-sel-color-team-orange')
			expect($sc_left_color[:taxi]).to include('uaf-sel-color-taxi')
			expect($sc_left_color[:neptune]).to include('uaf-sel-color-neptune')
			expect($sc_left_color[:blue]).to include('uaf-sel-color-carolina-blue')
			expect($sc_left_color[:royal]).to include('uaf-sel-color-team-royal-component')
			expect($sc_left_color[:midnight]).to include('uaf-sel-color-midnight-navy')
			expect($sc_left_color[:purple]).to include('uaf-sel-color-purple')
			expect($sc_right_color[:white]).to include('uaf-sel-color-white')
			expect($sc_right_color[:black]).to include('uaf-sel-color-black')
			expect($sc_right_color[:silver]).to include('uaf-sel-color-metallic-silver')
			expect($sc_right_color[:gold]).to include('uaf-sel-color-metallic-gold')
			expect($sc_right_color[:steel]).to include('uaf-sel-color-steel')
			expect($sc_right_color[:cardinal]).to include('uaf-sel-color-cardinal')
			expect($sc_right_color[:red]).to include('uaf-sel-color-red')
			expect($sc_right_color[:fire]).to include('uaf-sel-color-phoenix-fire')
			expect($sc_right_color[:orange]).to include('uaf-sel-color-team-orange')
			expect($sc_right_color[:taxi]).to include('uaf-sel-color-taxi')
			expect($sc_right_color[:neptune]).to include('uaf-sel-color-neptune')
			expect($sc_right_color[:blue]).to include('uaf-sel-color-carolina-blue')
			expect($sc_right_color[:royal]).to include('uaf-sel-color-team-royal-component')
			expect($sc_right_color[:midnight]).to include('uaf-sel-color-midnight-navy')
			expect($sc_right_color[:purple]).to include('uaf-sel-color-purple')
		end
	end
end