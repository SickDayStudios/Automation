class IconBasePage < BasePage
	include PageObject

$icon_pids = [
"pid3000416",
"pid3000414",
"pid3020924",
"pid3020925",
"pid3021634",
"pid3021635",
"pid3021636",
"pid3021637"
]

def recipe_id_list
	@array = Array.new
	$icon_pids.each do |pid|
		self.goto "https://staging.underarmour.com/en-us/#{pid}"
		self.wait_while { self.url == "https://staging.underarmour.com/en-us/#{pid}" }
		id = self.url.split(//).last(8).join
		puts id
		@array.push(id)
	end
	return @array
end

end