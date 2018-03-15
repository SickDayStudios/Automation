describe "AccessibilityTests" do

    before(:all) do
        @page = BasePage.new
        @page.goto "http://staging.spectrumcustomizer.com/under-armour/icon/specification/CW4RHE2B/html"
    end

    # after(:all) do

    # end
        
    it "Accessibility Test" do
        expect(@page).to be_accessible.according_to(:wcag2a)
    end         
end