require './lib/pages/uau/uau_base_page'


describe "Under Armour: 3D Model Shader Test" do

	before(:all) do
		BasePage.setup
		@page = UAUBasePage.new
	end

	$football.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$volleyball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$track.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$soccer.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$basketball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$training.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$sideline.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$baseball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end

	$softball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			@page.get_page_errors
		end
	end
end