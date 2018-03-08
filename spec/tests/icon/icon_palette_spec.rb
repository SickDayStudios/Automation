require "./lib/pages/icon/icon_base_page"
require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Color Palette Test" do 

	before(:all) do
		@curry_mid = IconBasePage.localize_text_message_handles('uaf-prs-curry1-mens')
		@clutchfit = IconBasePage.localize_text_message_handles('uaf-prs-clutchfit-mens')
		@charged = IconBasePage.localize_text_message_handles('uaf-prs-charged247-mens')
		@highlight = IconBasePage.localize_text_message_handles('uaf-prs-highlight-mens')
		@drive_four = IconBasePage.localize_text_message_handles('uaf-prs-drive4-mens')
		@drive_low = IconBasePage.localize_text_message_handles('uaf-prs-drive4low-mens')
		@curry_low = IconBasePage.localize_text_message_handles('uaf-prs-curry1low-mens')
	end

	it "Curry 1 Mid" do
		aggregate_failures "Curry 1 Mid" do
			expect($curry_mid[:solid]).to match_array(@curry_mid["uaf-fea-curry1-upper-solid-color"])
			expect($curry_mid[:pattern]).to match_array(@curry_mid["uaf-fea-curry1-upper-pattern-colors"])
			expect($curry_mid[:outsole]).to match_array(@curry_mid["uaf-fea-curry1-outsole-color"])
			expect($curry_mid[:laces]).to match_array(@curry_mid["uaf-fea-curry1-shoelace-color"])
			expect($curry_mid[:toecap]).to match_array(@curry_mid["uaf-fea-curry1-toe-tip-color"])
			expect($curry_mid[:shank]).to match_array(@curry_mid["uaf-fea-curry1-shank-color"])
			expect($curry_mid[:lining]).to match_array(@curry_mid["uaf-fea-curry1-internal-lining-color"])
			expect($curry_mid[:upper_logo]).to match_array(@curry_mid["uaf-fea-curry1-ua-logo-color"])
			expect($curry_mid[:heel]).to match_array(@curry_mid["uaf-fea-curry1-heel-counter-color"])
			expect($curry_mid[:tongue]).to match_array(@curry_mid["uaf-fea-curry1-tongue-color"])
			expect($curry_mid[:tongue_logo]).to match_array(@curry_mid["uaf-fea-curry1-tongue-top-logo-color"])
			expect($curry_mid[:topline]).to match_array(@curry_mid["uaf-fea-curry1-topline-midsole-color"])
			expect($curry_mid[:midsole]).to match_array(@curry_mid["uaf-fea-curry1-lower-midsole-color"])
		end
	end

	it "Clutchfit" do
		aggregate_failures "Clutchfit" do
			expect($clutchfit[:upper]).to match_array(@clutchfit["uaf-fea-clutchfit-upper-solid-color"])
			expect($clutchfit[:lining]).to match_array(@clutchfit["uaf-fea-clutchfit-collar-rib-lining-color"])
			expect($clutchfit[:laces]).to match_array(@clutchfit["uaf-fea-clutchfit-shoelace-color"])
			expect($clutchfit[:tongue]).to match_array(@clutchfit["uaf-fea-clutchfit-tongue-color"])
			expect($clutchfit[:logo]).to match_array(@clutchfit["uaf-fea-clutchfit-ua-logo-color"])
			expect($clutchfit[:logo_outline]).to match_array(@clutchfit["uaf-fea-clutchfit-ua-logo-outline-color"])
			expect($clutchfit[:plate]).to match_array(@clutchfit["uaf-fea-clutchfit-front-plate-color"])
		end
	end

	it "Charged 24/7" do
		aggregate_failures "Charged 24/7" do
			expect($charged[:forefoot]).to match_array(@charged["uaf-fea-charged247-forefoot-solid-color"])
			expect($charged[:strap]).to match_array(@charged["uaf-fea-charged247-strap-color"])
			expect($charged[:heel]).to match_array(@charged["uaf-fea-charged247-heel-color"])
			expect($charged[:base]).to match_array(@charged["uaf-fea-charged247-midsole-color"])
			expect($charged[:laces]).to match_array(@charged["uaf-fea-charged247-laces-color"])
			expect($charged[:logo]).to match_array(@charged["uaf-fea-charged247-ua-logo-color"])
			expect($charged[:outsole]).to match_array(@charged["uaf-fea-charged247-outsole-color"])
			expect($charged[:speckling]).to match_array(@charged["uaf-fea-charged247-speckling-color"])
		end
	end

	it "Highlight" do
		aggregate_failures "Highlight" do
			expect($highlight[:upper]).to match_array(@highlight["uaf-fea-highlight-upper-solid-color"])
			expect($highlight[:laces]).to match_array(@highlight["uaf-fea-highlight-shoelace-color"])
			expect($highlight[:tongue]).to match_array(@highlight["uaf-fea-highlight-tongue-color"])
			expect($highlight[:logo]).to match_array(@highlight["uaf-fea-highlight-ua-logo-color"])
			# expect($highlight[:]).to match_array(@highlight["uaf-fea-highlight-heel-wordmark-color"])
			# expect($highlight[:]).to match_array(@highlight["uaf-fea-highlight-outsole-color"])
			expect($highlight[:plate]).to match_array(@highlight["uaf-fea-highlight-bottom-base-color"])
			expect($highlight[:skeleton]).to match_array(@highlight["uaf-fea-highlight-skeleton-color"])
			# expect($highlight[:]).to match_array(@highlight["uaf-fea-highlight-collar-lining-color"])
			# expect($highlight[:]).to match_array(@highlight["uaf-fea-highlight-tongue-logo-color"])
			expect($highlight[:heel]).to match_array(@highlight["uaf-fea-highlight-heel-counter-color"])
			# expect($highlight[:]).to match_array(@highlight["uaf-fea-highlight-stitching-color"])
			expect($highlight[:logo_outline]).to match_array(@highlight["uaf-fea-highlight-ua-logo-outline-color"])
		end
	end

	it "Drive 4" do
		aggregate_failures "Drive 4" do
			expect($drive_four[:overlay]).to match_array(@drive_four["uaf-fea-drive4-overlay-solid-color"])
			expect($drive_four[:tongue]).to match_array(@drive_four["uaf-fea-drive4-tongue-color"])
			expect($drive_four[:trim]).to match_array(@drive_four["uaf-fea-drive4-overlay-trim-color"])
			expect($drive_four[:logo]).to match_array(@drive_four["uaf-fea-drive4-ua-logo-color"])
			expect($drive_four[:heel]).to match_array(@drive_four["uaf-fea-drive4-heel-color"])
			expect($drive_four[:midsole]).to match_array(@drive_four["uaf-fea-drive4-midsole-color"])
			expect($drive_four[:midfoot]).to match_array(@drive_four["uaf-fea-drive4-midfoot-plate-color"])
			expect($drive_four[:laces]).to match_array(@drive_four["uaf-fea-drive4-laces-color"])
			expect($drive_four[:outsole]).to match_array(@drive_four["uaf-fea-drive4-outsole-color"])
			expect($drive_four[:colorblock]).to match_array(@drive_four["uaf-fea-drive4-colorblock-color"])
			expect($drive_four[:eyelets]).to match_array(@drive_four["uaf-fea-drive4-eyelet-color"])
		end
	end

	it "Drive 4 Low" do
		aggregate_failures "Drive 4 Low" do
			expect($drive_low[:pattern]).to match_array(@drive_low["uaf-fea-drive4low-overlay-pattern-colors"])
			expect($drive_low[:solid]).to match_array(@drive_low["uaf-fea-drive4low-overlay-solid-color"])
			expect($drive_low[:tongue]).to match_array(@drive_low["uaf-fea-drive4low-tongue-color"])
			expect($drive_low[:trim]).to match_array(@drive_low["uaf-fea-drive4low-overlay-trim-color"])
			expect($drive_low[:logo]).to match_array(@drive_low["uaf-fea-drive4low-ua-logo-color"])
			expect($drive_low[:heel]).to match_array(@drive_low["uaf-fea-drive4low-heel-color"])
			expect($drive_low[:midsole]).to match_array(@drive_low["uaf-fea-drive4low-midsole-color"])
			expect($drive_low[:midfoot]).to match_array(@drive_low["uaf-fea-drive4low-midfoot-plate-color"])
			expect($drive_low[:laces]).to match_array(@drive_low["uaf-fea-drive4low-laces-color"])
			expect($drive_low[:outsole]).to match_array(@drive_low["uaf-fea-drive4low-outsole-color"])
			expect($drive_low[:colorblock]).to match_array(@drive_low["uaf-fea-drive4low-colorblock-color"])
			expect($drive_low[:eyelets]).to match_array(@drive_low["uaf-fea-drive4low-eyelet-color"])
			# expect($drive_four[:]).to match_array(@drive_low["uaf-fea-drive4low-upper-color"])
		end
	end

	it "Curry 1 Low" do
		aggregate_failures "Curry 1 Low" do
			expect($curry_low[:shank]).to match_array(@curry_low["uaf-fea-curry1low-shank-color"])
			expect($curry_low[:midsole]).to match_array(@curry_low["uaf-fea-curry1low-lower-midsole-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low["uaf-fea-curry1low-tongue-top-logo-color"])
			expect($curry_low[:heel]).to match_array(@curry_low["uaf-fea-curry1low-heel-counter-color"])
			expect($curry_low[:solid]).to match_array(@curry_low["uaf-fea-curry1low-upper-solid-color"])
			expect($curry_low[:pattern]).to match_array(@curry_low["uaf-fea-curry1low-upper-pattern-colors"])
			expect($curry_low[:laces]).to match_array(@curry_low["uaf-fea-curry1low-shoelace-color"])
			expect($curry_low[:toecap]).to match_array(@curry_low["uaf-fea-curry1low-toe-tip-color"])
			expect($curry_low[:tongue]).to match_array(@curry_low["uaf-fea-curry1low-tongue-color"])
			expect($curry_low[:lining]).to match_array(@curry_low["uaf-fea-curry1low-internal-lining-color"])
			expect($curry_low[:topline]).to match_array(@curry_low["uaf-fea-curry1low-topline-midsole-color"])
			expect($curry_low[:outsole]).to match_array(@curry_low["uaf-fea-curry1low-outsole-color"])
			expect($curry_low[:laces]).to match_array(@curry_low["uaf-fea-curry1low-eyelets-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low["uaf-fea-curry1low-sc-logo-color"])
			# expect($curry_low[:tongue_logo]).to match_array(@curry_low["uaf-fea-curry1low-charged-logo-color"])
			# expect($curry_low[:outsole]).to match_array(@curry_low["uaf-fea-curry1low-outsole-logo-color"])
			# expect($curry_low[:outsole]).to match_array(@curry_low["uaf-fea-curry1low-outsole-line-logo-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low["uaf-fea-curry1low-ua-logo-color"])
			# expect($curry_low[:tongue]).to match_array(@curry_low["uaf-fea-curry1low-tongue-loop-color"])
			# expect($curry_low[:tongue_logo]).to match_array(@curry_low["uaf-fea-curry1low-men-right-uaicon-logo"])
		end
	end
end