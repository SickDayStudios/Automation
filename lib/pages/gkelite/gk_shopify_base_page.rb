require './lib/helpers/gkelite/gk_header'


class GKShopifyBasePage < BasePage
	include PageObject
	include GKHeader

$gk_products = ["8788","8731","8787","8253","8252","2008","4854","4875","4882","4885","4883","4888s","4892s","4893s","4894s","4895","4896s","7551","7557","7560","7561","7562","7567","7578","7585","7593","7596","7597","7598","7599","7600","7601","7603","7604","7605","7606","7607","7608","7609","7610","7611s","7613s","7616s","7617","7618","7619","7620","7621","7622","7623","7624","7625","7626","7627","7628","7629","7630","7631","9541","9585","9587","9591","9599","9600","9601","9602","9603","9604","9605","9608","9609","9610","9611","9612","9613","9614","9615s","9616","9617","9618","9619","9620","8777","9594","wl355","wl371","wl374","wl381","wl382","wl389","wl397","wl440","wl428","1103s","1817","1853","1873","1933","1939","1946","1954","1960","1964","1966","1974s","1101s","1102s","1104s","1105s","1106s","1108s","1107s","1109s","1110s","1112","1113","1965","1111","1846","1818","6108","6109","6110","6111","6112","6113","6114","6115","6502","6506","6508","6710","6711","6713","6714","6501","6503","6701","6712s","6509s","6104","6116","6626","6654","6655","6656","6628","6627","4885S","7560S","7562S","7578S","7597S","7600S","7601S","7603S","7604S","7605S","7606S","7607S","7609S","7621S","7622S"]


$gk_svg_urls = [
"https://www.gkelite.com/apps/storage/images/project/style/1678.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1680.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1700m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1774.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1786.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1787.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1811m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1812m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1813m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1817m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1818m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1832m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1845m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1846m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1853st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1882m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1883m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1884m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/1885m.svg",
"https://www.gkelite.com/apps/storage/images/project/style/2011.svg",
"https://www.gkelite.com/apps/storage/images/project/style/2012.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3456.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3457.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3619.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3718.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3744.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3772.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3773.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3775.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3776.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3777.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3779.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3801.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3802.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3803.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3804.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3807.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3811.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3813.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3814.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3815.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3816.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3817.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3818.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3819.svg",
"https://www.gkelite.com/apps/storage/images/project/style/3820.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5841st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5844st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5846st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5847st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5848st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5849st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5850st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5851st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/5852st.svg",
"https://www.gkelite.com/apps/storage/images/project/style/6320.svg",
"https://www.gkelite.com/apps/storage/images/project/style/6331.svg",
"https://www.gkelite.com/apps/storage/images/project/style/6334.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e2071.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e2259.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3674.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3677.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3678.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3679.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3680.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3681.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3682.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3683.svg",
"https://www.gkelite.com/apps/storage/images/project/style/e3684.svg",
"https://www.gkelite.com/apps/storage/images/project/style/l1037.svg",
"https://www.gkelite.com/apps/storage/images/project/style/l1048.svg",
"https://www.gkelite.com/apps/storage/images/project/style/l1051.svg",
"https://www.gkelite.com/apps/storage/images/project/style/swu02.svg",
"https://www.gkelite.com/apps/storage/images/project/style/swu06.svg",
"https://www.gkelite.com/apps/storage/images/project/style/swu09.svg",
"https://www.gkelite.com/apps/storage/images/project/style/swu10.svg",
"https://www.gkelite.com/apps/storage/images/project/style/swu11.svg"
]

	text_field(:password, id: "password")
	button(:enter, name: "commit")

	def enter_password
		self.password_element.send_keys "iawhao"
		self.enter_element.click
	end


	def login_page
		$driver.goto $base_url + "/account/login"
		return GKLoginPage.new
	end

	def cart_page
		$driver.goto $base_url + "/cart"
		return GKCartPage.new
	end

	def search_page
		$driver.goto $base_url + "/pages/search-results-page?q="
		return GKSearchPage.new
	end

	def product_page(id)
		$driver.goto $base_url + "/products/#{id}"
		return GKProductPage.new
	end

	def home_page
		$driver.goto $base_url
		return GKHomePage.new
	end

	def collections(id)
		$driver.goto $base_url + "/collections/#{id}?view=product"
	end
end