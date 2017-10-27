require './lib/pages/uau/uau_base_page'


describe "Under Armour: 3D Model Shader Test" do

	before(:all) do
		BasePage.setup
		@page = UAUBasePage.new
	end

	$football.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	$volleyball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	$track.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	$soccer.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	$basketball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	$training.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	# $wrestling.each do |id|
	# 		it "#{id}" do
	#			puts id
					# @page.uau_product(id)
					# @page.wait_until(60) { @page.loader? }
	# 	expect(@page).not_to have_errors
	# 	end
	# end

	$sideline.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	# $lacrosse.each do |id|
	#  	it "#{id}" do
	# 			puts id
	# 				@page.uau_product(id)
	# 				@page.wait_until(60) { @page.loader? }
	# 	expect(@page).not_to have_errors
	# 	end
	# end

	$baseball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end

	# $hockey.each do |id|
	# 		it "#{id}" do
	# 			puts id
	# 				@page.uau_product(id)
	# 				@page.wait_until(60) { @page.loader? }
	# 	expect(@page).not_to have_errors
	# 	end
	# end

	$softball.each do |id|
		it "#{id}" do
			@page.uau_product(id)
			if @page.product_image?
				@page.product_image_element.click
			end
			if @page.select_product?
				@page.select_product
			end
			@page.wait_until(90) { @page.loader? }
			@page.wait_while { @page.loader_element.visible? }
			@page.wait_until { @page.save_element.visible? }
			sleep 4
			@page.save
			@page.name_design = "test"
			@page.submit
			sleep 5
			BasePage.print_js_errors
		end
	end
end