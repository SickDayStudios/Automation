class BasePage
	include PageObject

	def initialize
		super($driver)
	end

	def self.unique_array(array)
		array.each do |i|
			array.remove(i)
		end


	def self.reverse_string(string)
		new_string = ""
		array = string.each_char.to_a
		array.length.times { new_string << array.pop }
		puts new_string
	end

	def self.reverse_array(array)
		new_arr = Array.new
		array.length.times {
			new_arr << array.pop
		}
		puts "#{new_arr}"
	end


	def self.fib(n)
		n <= 1 ? n : (fib(n - 1) + fib(n - 2))
	end

	def self.fibi(n)
		a = 0
		puts a
		b = 1
		while b <= n 
			puts b
			a,b = b,a+b
		end
	end

	def self.get_images(url)
		@images = Array.new
		@response = Nokogiri::XML.parse(RestClient.get("#{url}"){|response, request, result| response })
		images = @response.search('img')
		images.each do |img|
			if (img['width'] == "400") == false
				@images.push(img['src'])
			end
		end
		return @images
	end

	def self.image_data_to_png
		image_data = Base64.decode64(c['data:image/png;base64,'.length .. -1])
		File.open("#{$screenshotfolder}/.png", 'wb+') do |f|
			f.write image_data
		end
	end


	def self.image_diff(arg)
		self.adjust_images(recipe_id)
		n = 0
		Dir["#{$screenshotfolder}/#{recipe_id}/FE/*.png"].zip(Dir["#{$screenshotfolder}/#{recipe_id}/BER/*.png"]).each do |fe, ber|
			n += 1
			images = [
				ChunkyPNG::Image.from_file("#{fe}"),
				ChunkyPNG::Image.from_file("#{ber}")
			]
			output = ChunkyPNG::Image.new(images.first.width, images.last.width, WHITE)

			diff = []

			images.first.height.times do |y|
				images.first.row(y).each_with_index do |pixel, x|
					unless pixel == images.last[x,y]
						score = Math.sqrt(
							(r(images.last[x,y]) - r(pixel)) ** 2 +
							(g(images.last[x,y]) - g(pixel)) ** 2 +
							(b(images.last[x,y]) - b(pixel)) ** 2
							) / Math.sqrt(MAX ** 2 * 3)

						output[x,y] = grayscale(MAX - (score * 255).round)
						diff << score
					end
				end
			end

			puts "pixels (total):     #{images.first.pixels.length}"
			puts "pixels changed:     #{diff.length}"
			puts "image changed (%): #{(diff.inject {|sum, value| sum + value} / images.first.pixels.length) * 100}%"

			output.save("#{$screenshotfolder}/#{recipe_id}/diff-#{n}.png")
		end
	end

	def self.adjust_images(arg)
		Dir["#{$screenshotfolder}/#{recipe_id}/FE/*.png"].each do |img|
			new_image = Magick::Image.read(img)[0]
			new_image.resize_to_fit!(512,512)
			new_image.sharpen(radius=0.0, sigma=1.0)
			new_image.write img
		end
	end

	def self.validate_svg_from_zip(zip_dir, schema)
		schema = Nokogiri::XML::Schema(File.read(schema))
		# doc = Nokogiri::XML(File.open("#{zip_dir, schema}"))
		Zip::File.open(zip_dir, schema) do |zip_file|
			zip_file.each do |entry|
				if entry.get_input_stream.is_a?(Zip::InputStream) && entry.name.include?(".svg")
					doc = Nokogiri::XML.parse(entry.get_input_stream)
					schema.validate(doc).each do |error|
						puts "#{entry.name}: #{error.message}"
						puts ""
					end
				end
			end
		end
	end

	def self.validate_svg_from_url(url, schema)
		File.write 'image.svg', open("#{url}").read
		schema = Nokogiri::XML::Schema(File.read(schema))
		doc = Nokogiri::XML(File.open("#{Dir.pwd}/image.svg"))
		schema.validate(doc).each do |error|
			puts "#{url} | #{error.message}"
			puts ""
		end
	end

	def self.xml_parse(url)
		Nokogiri::XML.parse(RestClient.get(url){|response, request, result| response })
	end

	def self.json_parse(url)
		JSON.parse(RestClient.get(url){|response, request, result| response })
	end

	def self.set_device_to(device)
		case device.to_sym
		when :ipad then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :ipad, orientation: :landscape)
		when :iphone then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone, orientation: :landscape)
		when :phone then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :android_phone, orientation: :landscape)
		when :tablet then user = Webdriver::UserAgent.driver(browser: :chrome, agent: :android_tablet, orientation: :landscape)
		end
		args = ['--flag-switches-begin','--use-mobile-user-agent','--window-position=0,0','--disable-infobars','--flag-switches-end']
		$driver = Watir::Browser.new user, options: { args: args }
	end

	def self.performance_check
		case 
		when $driver.performance.summary[:response_time] > 3000
			puts ("Response time: #{$driver.performance.summary[:response_time]}ms".bold.red)
		when $driver.performance.summary[:response_time] < 2999
			puts ("Response time: #{$driver.performance.summary[:response_time]}ms".bold.green)
		end
	end

	def self.extract_zip(file)
		Zip::File.open('./reports/*.zip') do |zip_file|
			zip_file.each do |f|
				fpath = File.join($screenshotfolder, f.name)
				zip_file.extract(f, fpath) unless File.exist?(fpath)
			end
		end
	end

	def self.download_image(src,df)
		file_name = File.basename(src)
		file_name = file_name.scan(/^[^\?]*/)
		File.open("#{df}/#{file_name[0]}", 'wb') do |f|
			f.write open(src).read
		end
	end

	def wait_or_rescue(arg)
		begin
			self.wait_until { "#{arg}" }
		rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
			BasePage.print_js_errors
		end
	end

	def self.print_js_errors
		log = $driver.driver.manage.logs.get(:browser)
		errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
		if errors.count > 0
			javascript_errors = errors.map(&:message).join("\n")
			puts "PageError:\n#{javascript_errors}"
		end
	end

	def self.print_js_warnings
		log = $driver.driver.manage.logs.get(:browser)
		errors = log.select{ |entry| entry.level.eql? 'WARNING' }
		if errors.count > 0
			javascript_errors = errors.map(&:message).join("\n\n")
			puts "\nPageError:\n#{javascript_errors}"
		end
	end

	def self.raise_js_errors
		log = $driver.driver.manage.logs.get(:browser)
		errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
		if errors.count > 0
			javascript_errors = errors.map(&:message).join("\n")
			raise javascript_errors
		end
	end

	def self.collect_links_src
		$driver.links.collect
	end

	def self.collect_links_href
		$driver.links.collect(&:href)
	end

	def self.collect_links_text
		$driver.links.collect(&:text)
	end

	def self.navigate_to_starting_page
		$driver.goto $base_url
	end

	def self.quit_webdriver
		$driver.quit
	end

	def self.create_jira_csv
		CSV.open("#{$screenshotfolder}/#{$csv_file}", "wb") do |csv|
			csv << ["Summary","Issue Type","Assignee","Status","Priority","Reporter","Creator","Due Date","Description","Outward Issue Link"]
		end
	end

	def self.update_jira_csv(summary, description)
		CSV.open("#{$screenshotfolder}/#{$csv_file}", "a+") do |csv| 
			csv << ["#{summary}","Task","cwilliams","To Do","Normal","cwilliams","cwilliams","","#{description}","",""]
		end
	end
end