
 
describe "AccessibilityTests" do

    before(:all) do
        @page = BasePage.new
        @page.goto "http://watir.com/guides/special-keys/"
    end

    # after(:all) do

    # end
        
    it "" do
        @page.run_wave_on_page
    end         
end