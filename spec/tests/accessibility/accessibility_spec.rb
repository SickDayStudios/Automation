describe "AccessibilityTests" do

    before(:all) do
        @page = BasePage.new
        @page.goto "#{ENV['URL']}"
    end

    # after(:all) do

    # end
        
    it "Accessibility Test" do
        expect(@page).to be_accessible.according_to(ENV['STANDARD'])
    end         
end