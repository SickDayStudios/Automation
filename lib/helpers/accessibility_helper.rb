module AccessibilityModule
	include PageObject

	def wave_icons
		elements(tag_name: "image", class: "wave5icon")
	end

	def run_wave_on_page
		# $driver.(frame(id: "wave_sidebar_container").link(href: "#details")).click
		# $driver.screenshot.save "#{$screenshotfolder}/Styles-#{Time.new.strftime("%d%b%Y-%H%M%S")}.png"
		# $driver.(frame(id: "wave_sidebar_container").link(id: "contrast")).click
		# $driver.screenshot.save "#{$screenshotfolder}/Contrast-#{Time.new.strftime("%d%b%Y-%H%M%S")}.png"
		# self.wave_icons_elements.each do |icon|
		# 	puts icon.alt
		# end
	end

end