require "./lib/pages/base_page"

describe "Fibonacci Test" do

	context "Fibonacci Methods" do

		it "Tests the Fibonacci method" do
			(0..16).each do |n|
				puts BasePage.fib(n)
			end
		end

		it "Test Fibi Method" do
			BasePage.fibi(1000)
		end

	end

	context "Reverse Methods" do

		it "Tests the Reverse String Method" do
			BasePage.reverse_string("hello")
		end

		it "Test reverse Array Method" do 
			BasePage.reverse_array([1,2,3,4,5,6,7,8,9])
		end

	end

end