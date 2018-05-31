require "./lib/pages/icon/icon_base_page"
require "./lib/pages/icon/icon_customizer_page"

describe "ICON | Color Palette Test" do 

	it "Curry 1 Mid Men's" do
		aggregate_failures "Curry 1 Mid Men's" do
			@curry_mid_mens = IconBasePage.localize_text_message_handles('uaf-prs-curry1-mens')
			# puts @curry_mid_mens
			expect($curry_mid[:solid]).to match_array(@curry_mid_mens["uaf-fea-curry1-upper-solid-color"])
			expect($curry_mid[:pattern]).to match_array(@curry_mid_mens["uaf-fea-curry1-upper-pattern-colors"])
			expect($curry_mid[:outsole]).to match_array(@curry_mid_mens["uaf-fea-curry1-outsole-color"])
			expect($curry_mid[:laces]).to match_array(@curry_mid_mens["uaf-fea-curry1-shoelace-color"])
			expect($curry_mid[:toecap]).to match_array(@curry_mid_mens["uaf-fea-curry1-toe-tip-color"])
			expect($curry_mid[:shank]).to match_array(@curry_mid_mens["uaf-fea-curry1-shank-color"])
			expect($curry_mid[:lining]).to match_array(@curry_mid_mens["uaf-fea-curry1-internal-lining-color"])
			expect($curry_mid[:upper_logo]).to match_array(@curry_mid_mens["uaf-fea-curry1-ua-logo-color"])
			expect($curry_mid[:heel]).to match_array(@curry_mid_mens["uaf-fea-curry1-heel-counter-color"])
			expect($curry_mid[:tongue]).to match_array(@curry_mid_mens["uaf-fea-curry1-tongue-color"])
			expect($curry_mid[:tongue_logo]).to match_array(@curry_mid_mens["uaf-fea-curry1-tongue-top-logo-color"])
			expect($curry_mid[:topline]).to match_array(@curry_mid_mens["uaf-fea-curry1-topline-midsole-color"])
			expect($curry_mid[:midsole]).to match_array(@curry_mid_mens["uaf-fea-curry1-lower-midsole-color"])
			expect($curry_mid[:left_logo]).to match_array(@curry_mid_mens["uaf-fea-curry1-men-left-uaicon-logo"])
			expect($curry_mid[:right_logo]).to match_array(@curry_mid_mens["uaf-fea-curry1-men-right-uaicon-logo"])
		end
	end

	it "Curry 1 Mid Youth" do
		aggregate_failures "Curry 1 Mid Youth" do
			@curry_mid_youth = IconBasePage.localize_text_message_handles('uaf-prs-curry1-youth')
			# puts @curry_mid_youth
			expect($curry_mid[:solid]).to match_array(@curry_mid_youth["uaf-fea-curry1-upper-solid-color"])
			expect($curry_mid[:pattern]).to match_array(@curry_mid_youth["uaf-fea-curry1-upper-pattern-colors"])
			expect($curry_mid[:outsole]).to match_array(@curry_mid_youth["uaf-fea-curry1-outsole-color"])
			expect($curry_mid[:laces]).to match_array(@curry_mid_youth["uaf-fea-curry1-shoelace-color"])
			expect($curry_mid[:toecap]).to match_array(@curry_mid_youth["uaf-fea-curry1-toe-tip-color"])
			expect($curry_mid[:shank]).to match_array(@curry_mid_youth["uaf-fea-curry1-shank-color"])
			expect($curry_mid[:lining]).to match_array(@curry_mid_youth["uaf-fea-curry1-internal-lining-color"])
			expect($curry_mid[:upper_logo]).to match_array(@curry_mid_youth["uaf-fea-curry1-ua-logo-color"])
			expect($curry_mid[:heel]).to match_array(@curry_mid_youth["uaf-fea-curry1-heel-counter-color"])
			expect($curry_mid[:tongue]).to match_array(@curry_mid_youth["uaf-fea-curry1-tongue-color"])
			expect($curry_mid[:tongue_logo]).to match_array(@curry_mid_youth["uaf-fea-curry1-tongue-top-logo-color"])
			expect($curry_mid[:topline]).to match_array(@curry_mid_youth["uaf-fea-curry1-topline-midsole-color"])
			expect($curry_mid[:midsole]).to match_array(@curry_mid_youth["uaf-fea-curry1-lower-midsole-color"])
		end
	end

	it "Clutchfit Men's" do
		aggregate_failures "Clutchfit Men's" do
			@clutchfit_mens = IconBasePage.localize_text_message_handles('uaf-prs-clutchfit-mens')
			# puts @clutchfit_mens
			expect($clutchfit[:upper]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-upper-solid-color"])
			expect($clutchfit[:lining]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-collar-rib-lining-color"])
			expect($clutchfit[:laces]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-shoelace-color"])
			expect($clutchfit[:tongue]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-tongue-color"])
			expect($clutchfit[:logo]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-ua-logo-color"])
			expect($clutchfit[:logo_outline]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-ua-logo-outline-color"])
			expect($clutchfit[:plate]).to match_array(@clutchfit_mens["uaf-fea-clutchfit-front-plate-color"])
		end
	end

	it "Clutchfit Women's" do
		aggregate_failures "Clutchfit Women's" do
			@clutchfit_womens = IconBasePage.localize_text_message_handles('uaf-prs-clutchfit-womens')
			# puts @clutchfit_womens
			expect($clutchfit[:upper]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-upper-solid-color"])
			expect($clutchfit[:lining]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-collar-rib-lining-color"])
			expect($clutchfit[:laces]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-shoelace-color"])
			expect($clutchfit[:tongue]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-tongue-color"])
			expect($clutchfit[:logo]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-ua-logo-color"])
			expect($clutchfit[:logo_outline]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-ua-logo-outline-color"])
			expect($clutchfit[:plate]).to match_array(@clutchfit_womens["uaf-fea-clutchfit-front-plate-color"])
		end
	end

	it "Charged 24/7 Men's" do
		aggregate_failures "Charged 24/7 Men's" do
			@charged_mens = IconBasePage.localize_text_message_handles('uaf-prs-charged247-mens')
			# puts @charged_mens
			expect($charged[:forefoot]).to match_array(@charged_mens["uaf-fea-charged247-forefoot-solid-color"])
			expect($charged[:strap]).to match_array(@charged_mens["uaf-fea-charged247-strap-color"])
			expect($charged[:heel]).to match_array(@charged_mens["uaf-fea-charged247-heel-color"])
			expect($charged[:base]).to match_array(@charged_mens["uaf-fea-charged247-midsole-color"])
			expect($charged[:laces]).to match_array(@charged_mens["uaf-fea-charged247-laces-color"])
			expect($charged[:logo]).to match_array(@charged_mens["uaf-fea-charged247-ua-logo-color"])
			expect($charged[:outsole]).to match_array(@charged_mens["uaf-fea-charged247-outsole-color"])
			expect($charged[:speckling]).to match_array(@charged_mens["uaf-fea-charged247-speckling-color"])
		end
	end

	it "Charged 24/7 Women's" do
		aggregate_failures "Charged 24/7 Women's" do
			@charged_womens = IconBasePage.localize_text_message_handles('uaf-prs-charged247-womens')
			# puts @charged_womens
			expect($charged[:forefoot]).to match_array(@charged_womens["uaf-fea-charged247-forefoot-solid-color"])
			expect($charged[:strap]).to match_array(@charged_womens["uaf-fea-charged247-strap-color"])
			expect($charged[:heel]).to match_array(@charged_womens["uaf-fea-charged247-heel-color"])
			expect($charged[:base]).to match_array(@charged_womens["uaf-fea-charged247-midsole-color"])
			expect($charged[:laces]).to match_array(@charged_womens["uaf-fea-charged247-laces-color"])
			expect($charged[:logo]).to match_array(@charged_womens["uaf-fea-charged247-ua-logo-color"])
			expect($charged[:outsole]).to match_array(@charged_womens["uaf-fea-charged247-outsole-color"])
			expect($charged[:speckling]).to match_array(@charged_womens["uaf-fea-charged247-speckling-color"])
		end
	end

	it "Highlight Men's" do
		aggregate_failures "Highlight Men's" do
			@highlight_mens = IconBasePage.localize_text_message_handles('uaf-prs-highlight-mens')
			# puts @highlight_mens
			expect($highlight[:upper]).to match_array(@highlight_mens["uaf-fea-highlight-upper-solid-color"])
			expect($highlight[:laces]).to match_array(@highlight_mens["uaf-fea-highlight-shoelace-color"])
			expect($highlight[:tongue]).to match_array(@highlight_mens["uaf-fea-highlight-tongue-color"])
			expect($highlight[:logo]).to match_array(@highlight_mens["uaf-fea-highlight-ua-logo-color"])
			expect($highlight[:wordmark]).to match_array(@highlight_mens["uaf-fea-highlight-heel-wordmark-color"])
			expect($highlight[:outsole]).to match_array(@highlight_mens["uaf-fea-highlight-outsole-color"])
			expect($highlight[:plate]).to match_array(@highlight_mens["uaf-fea-highlight-bottom-base-color"])
			expect($highlight[:skeleton]).to match_array(@highlight_mens["uaf-fea-highlight-skeleton-color"])
			expect($highlight[:lining]).to match_array(@highlight_mens["uaf-fea-highlight-collar-lining-color"])
			expect($highlight[:tongue_logo]).to match_array(@highlight_mens["uaf-fea-highlight-tongue-logo-color"])
			expect($highlight[:heel]).to match_array(@highlight_mens["uaf-fea-highlight-heel-counter-color"])
			expect($highlight[:stitching]).to match_array(@highlight_mens["uaf-fea-highlight-stitching-color"])
			expect($highlight[:logo_outline]).to match_array(@highlight_mens["uaf-fea-highlight-ua-logo-outline-color"])
		end
	end

	it "Drive 4 Men's" do
		aggregate_failures "Drive 4 Men's" do
			@drive_four_mens = IconBasePage.localize_text_message_handles('uaf-prs-drive4-mens')
			# puts @drive_four_mens
			expect($drive_four[:overlay]).to match_array(@drive_four_mens["uaf-fea-drive4-overlay-solid-color"])
			expect($drive_four[:tongue]).to match_array(@drive_four_mens["uaf-fea-drive4-tongue-color"])
			expect($drive_four[:trim]).to match_array(@drive_four_mens["uaf-fea-drive4-overlay-trim-color"])
			expect($drive_four[:logo]).to match_array(@drive_four_mens["uaf-fea-drive4-ua-logo-color"])
			expect($drive_four[:heel]).to match_array(@drive_four_mens["uaf-fea-drive4-heel-color"])
			expect($drive_four[:midsole]).to match_array(@drive_four_mens["uaf-fea-drive4-midsole-color"])
			expect($drive_four[:midfoot]).to match_array(@drive_four_mens["uaf-fea-drive4-midfoot-plate-color"])
			expect($drive_four[:laces]).to match_array(@drive_four_mens["uaf-fea-drive4-laces-color"])
			expect($drive_four[:outsole]).to match_array(@drive_four_mens["uaf-fea-drive4-outsole-color"])
			expect($drive_four[:colorblock]).to match_array(@drive_four_mens["uaf-fea-drive4-colorblock-color"])
			expect($drive_four[:eyelets]).to match_array(@drive_four_mens["uaf-fea-drive4-eyelet-color"])
		end
	end

	it "Drive 4 Women's" do
		aggregate_failures "Drive 4 Women's" do
			@drive_four_womens = IconBasePage.localize_text_message_handles('uaf-prs-drive4-womens')
			# puts @drive_four_womens
			expect($drive_four[:overlay]).to match_array(@drive_four_womens["uaf-fea-drive4-overlay-solid-color"])
			expect($drive_four[:tongue]).to match_array(@drive_four_womens["uaf-fea-drive4-tongue-color"])
			expect($drive_four[:trim]).to match_array(@drive_four_womens["uaf-fea-drive4-overlay-trim-color"])
			expect($drive_four[:logo]).to match_array(@drive_four_womens["uaf-fea-drive4-ua-logo-color"])
			expect($drive_four[:heel]).to match_array(@drive_four_womens["uaf-fea-drive4-heel-color"])
			expect($drive_four[:midsole]).to match_array(@drive_four_womens["uaf-fea-drive4-midsole-color"])
			expect($drive_four[:midfoot]).to match_array(@drive_four_womens["uaf-fea-drive4-midfoot-plate-color"])
			expect($drive_four[:laces]).to match_array(@drive_four_womens["uaf-fea-drive4-laces-color"])
			expect($drive_four[:outsole]).to match_array(@drive_four_womens["uaf-fea-drive4-outsole-color"])
			expect($drive_four[:colorblock]).to match_array(@drive_four_womens["uaf-fea-drive4-colorblock-color"])
			expect($drive_four[:eyelets]).to match_array(@drive_four_womens["uaf-fea-drive4-eyelet-color"])
		end
	end

	it "Drive 4 Low Men's" do
		aggregate_failures "Drive 4 Low Men's" do
			@drive_low_mens = IconBasePage.localize_text_message_handles('uaf-prs-drive4low-mens')
			# puts @drive_low_mens
			expect($drive_low[:pattern]).to match_array(@drive_low_mens["uaf-fea-drive4low-overlay-pattern-colors"])
			expect($drive_low[:solid]).to match_array(@drive_low_mens["uaf-fea-drive4low-overlay-solid-color"])
			expect($drive_low[:tongue]).to match_array(@drive_low_mens["uaf-fea-drive4low-tongue-color"])
			expect($drive_low[:trim]).to match_array(@drive_low_mens["uaf-fea-drive4low-overlay-trim-color"])
			expect($drive_low[:logo]).to match_array(@drive_low_mens["uaf-fea-drive4low-ua-logo-color"])
			expect($drive_low[:heel]).to match_array(@drive_low_mens["uaf-fea-drive4low-heel-color"])
			expect($drive_low[:midsole]).to match_array(@drive_low_mens["uaf-fea-drive4low-midsole-color"])
			expect($drive_low[:midfoot]).to match_array(@drive_low_mens["uaf-fea-drive4low-midfoot-plate-color"])
			expect($drive_low[:laces]).to match_array(@drive_low_mens["uaf-fea-drive4low-laces-color"])
			expect($drive_low[:outsole]).to match_array(@drive_low_mens["uaf-fea-drive4low-outsole-color"])
			expect($drive_low[:colorblock]).to match_array(@drive_low_mens["uaf-fea-drive4low-colorblock-color"])
			expect($drive_low[:eyelets]).to match_array(@drive_low_mens["uaf-fea-drive4low-eyelet-color"])
			expect($drive_four[:upper]).to match_array(@drive_low_mens["uaf-fea-drive4low-upper-color"])
			expect($drive_four[:right_text]).to match_array(@drive_low_mens["uaf-fea-drive4low-right-outside-text-color"])
			expect($drive_four[:left_text]).to match_array(@drive_low_mens["uaf-fea-drive4low-left-outside-text-color"])
		end
	end

	it "Curry 1 Low Men's" do
		aggregate_failures "Curry 1 Low Men's" do
			@curry_low_mens = IconBasePage.localize_text_message_handles('uaf-prs-curry1low-mens')
			# puts @curry_low_mens
			expect($curry_low[:shank]).to match_array(@curry_low_mens["uaf-fea-curry1low-shank-color"])
			expect($curry_low[:midsole]).to match_array(@curry_low_mens["uaf-fea-curry1low-lower-midsole-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low_mens["uaf-fea-curry1low-tongue-top-logo-color"])
			expect($curry_low[:heel]).to match_array(@curry_low_mens["uaf-fea-curry1low-heel-counter-color"])
			expect($curry_low[:solid]).to match_array(@curry_low_mens["uaf-fea-curry1low-upper-solid-color"])
			expect($curry_low[:pattern]).to match_array(@curry_low_mens["uaf-fea-curry1low-upper-pattern-colors"])
			expect($curry_low[:laces]).to match_array(@curry_low_mens["uaf-fea-curry1low-shoelace-color"])
			expect($curry_low[:toecap]).to match_array(@curry_low_mens["uaf-fea-curry1low-toe-tip-color"])
			expect($curry_low[:tongue]).to match_array(@curry_low_mens["uaf-fea-curry1low-tongue-color"])
			expect($curry_low[:lining]).to match_array(@curry_low_mens["uaf-fea-curry1low-internal-lining-color"])
			expect($curry_low[:topline]).to match_array(@curry_low_mens["uaf-fea-curry1low-topline-midsole-color"])
			expect($curry_low[:outsole]).to match_array(@curry_low_mens["uaf-fea-curry1low-outsole-color"])
			expect($curry_low[:laces]).to match_array(@curry_low_mens["uaf-fea-curry1low-eyelets-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low_mens["uaf-fea-curry1low-sc-logo-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low_mens["uaf-fea-curry1low-charged-logo-color"])
			expect($curry_low[:outsole]).to match_array(@curry_low_mens["uaf-fea-curry1low-outsole-logo-color"])
			expect($curry_low[:outsole]).to match_array(@curry_low_mens["uaf-fea-curry1low-outsole-line-logo-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low_mens["uaf-fea-curry1low-ua-logo-color"])
			expect($curry_low[:tongue]).to match_array(@curry_low_mens["uaf-fea-curry1low-tongue-loop-color"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low_mens["uaf-fea-curry1low-men-right-uaicon-logo"])
			expect($curry_low[:tongue_logo]).to match_array(@curry_low_mens["uaf-fea-curry1low-men-left-uaicon-logo"])
		end
	end

	it "Sackpack" do
		aggregate_failures "Sackpack" do
			@sackpack = IconBasePage.localize_text_message_handles('uaf-prs-icon-sackpack')
			# puts @sackpack
			expect($sackpack[:upper]).to match_array(@sackpack['uaf-fea-icon-sackpack-overlay-solid'])
			expect($sackpack[:logo]).to match_array(@sackpack['uaf-fea-icon-sackpack-front-logo-color'])
			expect($sackpack[:expandable]).to match_array(@sackpack['uaf-fea-icon-sackpack-expandable-color'])
			expect($sackpack[:lining]).to match_array(@sackpack['uaf-fea-icon-sackpack-lining-color'])
			expect($sackpack[:zipper]).to match_array(@sackpack['uaf-fea-icon-sackpack-zipper-color'])
			expect($sackpack[:back]).to match_array(@sackpack['uaf-fea-icon-sackpack-back-panel-color'])
			expect($sackpack[:straps]).to match_array(@sackpack['uaf-fea-icon-sackpack-straps-color'])
			expect($sackpack[:webbing]).to match_array(@sackpack['uaf-fea-icon-sackpack-back-logo-color'])
			expect($sackpack[:label]).to match_array(@sackpack['uaf-fea-icon-sackpack-back-logo-color'])
		end
	end

	it "Ignite Men's" do
		aggregate_failures "Men's Ignite" do
			@mens_ignite = IconBasePage.localize_text_message_handles('uaf-prs-ignite-mens')
			# puts @mens_ignite
			expect($mens_ignite[:pattern]).to match_array(@mens_ignite['uaf-fea-ignite-footbed-overlay-pattern-colors'])
			expect($mens_ignite[:solid]).to match_array(@mens_ignite['uaf-fea-ignite-footbed-overlay-solid-color'])
			expect($mens_ignite[:strap]).to match_array(@mens_ignite['uaf-fea-ignite-mens-strap-color'])
			expect($mens_ignite[:strap_logo]).to match_array(@mens_ignite['uaf-fea-ignite-mens-strap-logo-color'])
			expect($mens_ignite[:lining]).to match_array(@mens_ignite['uaf-fea-ignite-mens-strap-lining-color'])
			expect($mens_ignite[:outsole]).to match_array(@mens_ignite['uaf-fea-ignite-outsole-color'])
			expect($mens_ignite[:left_text]).to match_array(@mens_ignite['uaf-fea-ignite-left-footbed-text-color'])
			expect($mens_ignite[:right_text]).to match_array(@mens_ignite['uaf-fea-ignite-right-footbed-text-color'])
		end
	end

	it "Ignite Women's" do
		aggregate_failures "Women's Ignite" do
			@womens_ignite = IconBasePage.localize_text_message_handles('uaf-prs-ignite-womens')
			# puts @womens_ignite
			expect($womens_ignite[:pattern]).to match_array(@womens_ignite['uaf-fea-ignite-footbed-overlay-pattern-colors'])
			expect($womens_ignite[:solid]).to match_array(@womens_ignite['uaf-fea-ignite-footbed-overlay-solid-color'])
			expect($womens_ignite[:strap]).to match_array(@womens_ignite['uaf-fea-ignite-womens-strap-color'])
			expect($womens_ignite[:strap_logo]).to match_array(@womens_ignite['uaf-fea-ignite-womens-strap-logo-color'])
			expect($womens_ignite[:lining]).to match_array(@womens_ignite['uaf-fea-ignite-womens-strap-lining-color'])
			expect($womens_ignite[:outsole]).to match_array(@womens_ignite['uaf-fea-ignite-outsole-color'])
			expect($womens_ignite[:left_text]).to match_array(@womens_ignite['uaf-fea-ignite-womens-left-footbed-text-color'])
			expect($womens_ignite[:right_text]).to match_array(@womens_ignite['uaf-fea-ignite-womens-right-footbed-text-color'])
		end
	end

	it "Railfit Men's" do
		aggregate_failures "Railfit Men's" do
			@railfit_mens = IconBasePage.localize_text_message_handles('uaf-prs-railfit-mens')
			# puts @railfit_mens
			expect($railfit[:collar]).to match_array(@railfit_mens['uaf-fea-railfit-collar-color'])
			expect($railfit[:upper]).to match_array(@railfit_mens['uaf-fea-railfit-upper-color'])
			expect($railfit[:laces]).to match_array(@railfit_mens['uaf-fea-railfit-lace-color'])
			expect($railfit[:heel]).to match_array(@railfit_mens['uaf-fea-railfit-heel-gore-tongue-patch-color'])
			expect($railfit[:panel]).to match_array(@railfit_mens['uaf-fea-railfit-side-panel-overlay-solid'])
			expect($railfit[:rails]).to match_array(@railfit_mens['uaf-fea-railfit-rails-color'])
			expect($railfit[:tongue]).to match_array(@railfit_mens['uaf-fea-railfit-stopper-webbing-color'])
			expect($railfit[:guide]).to match_array(@railfit_mens['uaf-fea-railfit-lace-guides-color'])
			expect($railfit[:outsole]).to match_array(@railfit_mens['uaf-fea-railfit-outsole-color'])
			expect($railfit[:midsole]).to match_array(@railfit_mens['uaf-fea-railfit-midsole-color'])
			expect($railfit[:sockliner]).to match_array(@railfit_mens['uaf-fea-railfit-sockliner-color'])
			expect($railfit[:left_text]).to match_array(@railfit_mens['uaf-fea-railfit-left-midsole-text-color'])
			expect($railfit[:right_text]).to match_array(@railfit_mens['uaf-fea-railfit-right-midsole-text-color'])
		end
	end

	it "Railfit Women's" do
		aggregate_failures "Railfit Women's" do
			@railfit_womens = IconBasePage.localize_text_message_handles('uaf-prs-railfit-womens')
			# puts @railfit_womens
			expect($railfit[:collar]).to match_array(@railfit_womens['uaf-fea-railfit-collar-color'])
			expect($railfit[:upper]).to match_array(@railfit_womens['uaf-fea-railfit-upper-color'])
			expect($railfit[:laces]).to match_array(@railfit_womens['uaf-fea-railfit-lace-color'])
			expect($railfit[:heel]).to match_array(@railfit_womens['uaf-fea-railfit-heel-gore-tongue-patch-color'])
			expect($railfit[:panel]).to match_array(@railfit_womens['uaf-fea-railfit-side-panel-overlay-solid'])
			expect($railfit[:rails]).to match_array(@railfit_womens['uaf-fea-railfit-rails-color'])
			expect($railfit[:tongue]).to match_array(@railfit_womens['uaf-fea-railfit-stopper-webbing-color'])
			expect($railfit[:guide]).to match_array(@railfit_womens['uaf-fea-railfit-lace-guides-color'])
			expect($railfit[:outsole]).to match_array(@railfit_womens['uaf-fea-railfit-outsole-color'])
			expect($railfit[:midsole]).to match_array(@railfit_womens['uaf-fea-railfit-midsole-color'])
			expect($railfit[:sockliner]).to match_array(@railfit_womens['uaf-fea-railfit-sockliner-color'])
			expect($railfit[:left_text]).to match_array(@railfit_womens['uaf-fea-railfit-left-midsole-text-color'])
			expect($railfit[:right_text]).to match_array(@railfit_womens['uaf-fea-railfit-right-midsole-text-color'])
		end
	end

	it "Spotlight Men's" do
		aggregate_failures "Spotlight Men's" do
			@spotlight_mens = IconBasePage.localize_text_message_handles('uaf-prs-spotlight-mens')
			# puts @spotlight_mens
			expect($spotlight[:knit]).to match_array(@spotlight_mens['uaf-fea-spotlight-knit-color'])
			expect($spotlight[:pattern]).to match_array(@spotlight_mens['uaf-fea-spotlight-upper-overlay-pattern-colors'])
			expect($spotlight[:solid]).to match_array(@spotlight_mens['uaf-fea-spotlight-upper-overlay-solid-color'])
			expect($spotlight[:trim]).to match_array(@spotlight_mens['uaf-fea-spotlight-trim-color'])
			expect($spotlight[:eyelets]).to match_array(@spotlight_mens['uaf-fea-spotlight-lace-loops-color'])
			expect($spotlight[:laces]).to match_array(@spotlight_mens['uaf-fea-spotlight-laces-color'])
			expect($spotlight[:plate]).to match_array(@spotlight_mens['uaf-fea-spotlight-cleat-plate-color'])
			expect($spotlight[:toe_logo]).to match_array(@spotlight_mens['uaf-fea-spotlight-toe-logo-color'])
			expect($spotlight[:toe_logo_outline]).to match_array(@spotlight_mens['uaf-fea-spotlight-toe-logo-outline-color'])
			expect($spotlight[:heel]).to match_array(@spotlight_mens['uaf-fea-spotlight-heel-color'])
			expect($spotlight[:weld]).to match_array(@spotlight_mens['uaf-fea-spotlight-heel-weld-color'])
			expect($spotlight[:medial]).to match_array(@spotlight_mens['uaf-fea-spotlight-medial-logo-color'])
			expect($spotlight[:medial_outline]).to match_array(@spotlight_mens['uaf-fea-spotlight-medial-logo-outline-color'])
			expect($spotlight[:left_text]).to match_array(@spotlight_mens['uaf-fea-spotlight-left-upper-text-color'])
			expect($spotlight[:right_text]).to match_array(@spotlight_mens['uaf-fea-spotlight-right-upper-text-color'])
		end
	end

	it "Men's Curry 5" do
		aggregate_failures "Men's Curry 5" do
			@curry_five_mens = IconBasePage.localize_text_message_handles("uaf-prs-curry5-mens")
			# puts @curry_five_mens
			expect($curry_five[:pattern]).to match_array(@curry_five_mens['uaf-fea-curry5-side-panel-overlay-pattern-colors'])
			expect($curry_five[:solid]).to match_array(@curry_five_mens['uaf-fea-curry5-side-panel-overlay-solid-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_mens['uaf-fea-curry5-upper-knit-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_mens['uaf-fea-curry5-heel-tape-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_mens['uaf-fea-curry5-eyestay-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_mens['uaf-fea-curry5-counter-lining-color'])
			expect($curry_five[:laces]).to match_array(@curry_five_mens['uaf-fea-curry5-laces-color'])
			expect($curry_five[:tongue]).to match_array(@curry_five_mens['uaf-fea-curry5-tongue-label-color'])
			expect($curry_five[:tongue]).to match_array(@curry_five_mens['uaf-fea-curry5-tongue-logo-color'])
			expect($curry_five[:midsole]).to match_array(@curry_five_mens['uaf-fea-curry5-midsole-color'])
			expect($curry_five[:side]).to match_array(@curry_five_mens['uaf-fea-curry5-side-tpu-color'])
			expect($curry_five[:bottom]).to match_array(@curry_five_mens['uaf-fea-curry5-bottom-tpu-color'])
			expect($curry_five[:outsole]).to match_array(@curry_five_mens['uaf-fea-curry5-outsole-color'])
			expect($curry_five[:logo]).to match_array(@curry_five_mens['uaf-fea-curry5-outsole-logo-color'])
			expect($curry_five[:signature]).to match_array(@curry_five_mens['uaf-fea-curry5-side-tpu-sc-signature-color'])
		end
	end

	it "Kid's Curry 5" do
		aggregate_failures "Kid's Curry 5" do
			@curry_five_kids = IconBasePage.localize_text_message_handles("uaf-prs-curry5-kids")
			# puts @curry_five_kids
			expect($curry_five[:pattern]).to match_array(@curry_five_kids['uaf-fea-curry5-side-panel-overlay-pattern-colors'])
			expect($curry_five[:solid]).to match_array(@curry_five_kids['uaf-fea-curry5-side-panel-overlay-solid-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_kids['uaf-fea-curry5-upper-knit-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_kids['uaf-fea-curry5-heel-tape-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_kids['uaf-fea-curry5-eyestay-color'])
			expect($curry_five[:upper]).to match_array(@curry_five_kids['uaf-fea-curry5-counter-lining-color'])
			expect($curry_five[:laces]).to match_array(@curry_five_kids['uaf-fea-curry5-laces-color'])
			expect($curry_five[:tongue]).to match_array(@curry_five_kids['uaf-fea-curry5-tongue-label-color'])
			expect($curry_five[:tongue]).to match_array(@curry_five_kids['uaf-fea-curry5-tongue-logo-color'])
			expect($curry_five[:midsole]).to match_array(@curry_five_kids['uaf-fea-curry5-midsole-color'])
			expect($curry_five[:side]).to match_array(@curry_five_kids['uaf-fea-curry5-side-tpu-color'])
			expect($curry_five[:bottom]).to match_array(@curry_five_kids['uaf-fea-curry5-bottom-tpu-color'])
			expect($curry_five[:outsole]).to match_array(@curry_five_kids['uaf-fea-curry5-outsole-color'])
			expect($curry_five[:logo]).to match_array(@curry_five_kids['uaf-fea-curry5-outsole-logo-color'])
			expect($curry_five[:signature]).to match_array(@curry_five_kids['uaf-fea-curry5-side-tpu-sc-signature-color'])
		end
	end

	it "HOVR HAVOC MID Mens" do
		aggregate_failures "HOVR HAVOC MID Mens" do
			@hovr_mid_mens = IconBasePage.localize_text_message_handles('uaf-prs-hovrhavoc-mens')
			# puts @hovr_mid_mens
			expect($hovr_havoc_mid[:pattern]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-upper-overlay-pattern-colors"])
			expect($hovr_havoc_mid[:solid]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-upper-overlay-solid-color"])
			expect($hovr_havoc_mid[:tongue]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-tongue-color"])
			expect($hovr_havoc_mid[:heel]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-heel-color"])
			expect($hovr_havoc_mid[:heel_logo]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-heel-logo-color"])
			expect($hovr_havoc_mid[:lining]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-lining-color"])
			expect($hovr_havoc_mid[:lycra]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-lycra-binding-color"])
			expect($hovr_havoc_mid[:bemis]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-bemis-tape-color"])
			expect($hovr_havoc_mid[:midfoot]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-midfoot-panel-color"])
			expect($hovr_havoc_mid[:forefoot]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-forefoot-film-color"])
			expect($hovr_havoc_mid[:laces]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-laces-color"])
			expect($hovr_havoc_mid[:lace_strap]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-lace-strap-color"])
			expect($hovr_havoc_mid[:strap_logo]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-lace-strap-logo-color"])
			expect($hovr_havoc_mid[:eyelets]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-welded-eyelets-color"])
			expect($hovr_havoc_mid[:webbing]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-lace-webbing-color"])
			expect($hovr_havoc_mid[:midsole]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-midsole-color"])
			expect($hovr_havoc_mid[:cushion]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-hovr-cushioning-color"])
			expect($hovr_havoc_mid[:mesh]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-hovr-mesh-color"])
			expect($hovr_havoc_mid[:outsole]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-outsole-color"])
			expect($hovr_havoc_mid[:logo]).to match_array(@hovr_mid_mens["uaf-fea-hovrhavoc-mid-ua-logo-color"])
		end
	end

	it "HOVR HAVOC MID WoMens" do
		aggregate_failures "HOVR HAVOC MID WoMen" do
			@hovr_mid_womens = IconBasePage.localize_text_message_handles('uaf-prs-hovrhavoc-womens')
			# puts @hovr_mid_womens
			expect($hovr_havoc_mid[:pattern]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-upper-overlay-pattern-colors"])
			expect($hovr_havoc_mid[:solid]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-upper-overlay-solid-color"])
			expect($hovr_havoc_mid[:tongue]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-tongue-color"])
			expect($hovr_havoc_mid[:heel]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-heel-color"])
			expect($hovr_havoc_mid[:heel_logo]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-heel-logo-color"])
			expect($hovr_havoc_mid[:lining]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-lining-color"])
			expect($hovr_havoc_mid[:lycra]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-lycra-binding-color"])
			expect($hovr_havoc_mid[:bemis]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-bemis-tape-color"])
			expect($hovr_havoc_mid[:midfoot]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-midfoot-panel-color"])
			expect($hovr_havoc_mid[:forefoot]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-forefoot-film-color"])
			expect($hovr_havoc_mid[:laces]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-laces-color"])
			expect($hovr_havoc_mid[:lace_strap]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-lace-strap-color"])
			expect($hovr_havoc_mid[:strap_logo]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-lace-strap-logo-color"])
			expect($hovr_havoc_mid[:eyelets]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-welded-eyelets-color"])
			expect($hovr_havoc_mid[:webbing]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-lace-webbing-color"])
			expect($hovr_havoc_mid[:midsole]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-midsole-color"])
			expect($hovr_havoc_mid[:cushion]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-hovr-cushioning-color"])
			expect($hovr_havoc_mid[:mesh]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-hovr-mesh-color"])
			expect($hovr_havoc_mid[:outsole]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-outsole-color"])
			expect($hovr_havoc_mid[:logo]).to match_array(@hovr_mid_womens["uaf-fea-hovrhavoc-mid-ua-logo-color"])
		end
	end

	it "HOVR HAVOC" do 
		aggregate_failures "HOVR HAVOC" do
			@hovr_mens = IconBasePage.localize_text_message_handles('uaf-prs-hovrhavoclow-mens')
			# puts @hovr_mens
			expect($hovr_havoc[:pattern]).to match_array(@hovr_mens["uaf-fea-hovrhavoc-upper-overlay-pattern-colors"])
			expect($hovr_havoc[:solid]).to match_array(@hovr_mens["uaf-fea-hovrhavoc-upper-overlay-solid-color"])
			expect($hovr_havoc[:tongue]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-tongue-color"])
			expect($hovr_havoc[:heel]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-heel-color"])
			expect($hovr_havoc[:heel_logo]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-heel-logo-color"])
			expect($hovr_havoc[:lining]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-lining-color"])
			expect($hovr_havoc[:lycra]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-lycra-binding-color"])
			expect($hovr_havoc[:midfoot]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-midfoot-panel-color"])
			expect($hovr_havoc[:forefoot]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-forefoot-film-color"])
			expect($hovr_havoc[:laces]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-laces-color"])
			expect($hovr_havoc[:webbing]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-lace-webbing-color"])
			expect($hovr_havoc[:tongue_logo]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-tongue-tab-logo-color"])
			expect($hovr_havoc[:eyelets]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-welded-eyelets-color"])
			expect($hovr_havoc[:stitching]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-stitching-color"])
			expect($hovr_havoc[:midsole]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-midsole-color"])
			expect($hovr_havoc[:mesh]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-hovr-mesh-color"])
			expect($hovr_havoc[:outsole]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-outsole-color"])
			expect($hovr_havoc[:logo]).to match_array(@hovr_mens["uaf-fea-hovrhavoclow-ua-logo-color"])
		end
	end

	it "HOVR SLK Mens" do 
		aggregate_failures "HOVR SLK Mens" do
			@hovr_slk_mens = IconBasePage.localize_text_message_handles('uaf-prs-hovrslk-mens')
			# puts @hovr_slk_mens
			expect($hovr_slk[:heel]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-heel-counter-color"])
			expect($hovr_slk[:tongue]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-tongue-color"])
			expect($hovr_slk[:branding]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-tongue-branding-color"])
			expect($hovr_slk[:binding]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-collar-binding-color"])
			expect($hovr_slk[:lining_tongue]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-lining-tongue-backer-color"])
			expect($hovr_slk[:heel_lining]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-heel-lining-color"])
			expect($hovr_slk[:laces]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-laces-color"])
			expect($hovr_slk[:webbing]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-eyestay-webbing-color"])
			expect($hovr_slk[:eyestay]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-eyestay-tpu-color"])
			expect($hovr_slk[:thread]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-eyestay-thread-color"])
			expect($hovr_slk[:quarter]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-quarter-tpu-color"])
			expect($hovr_slk[:tab]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-heel-tab-color"])
			expect($hovr_slk[:midsole]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-upper-midsole-color"])
			expect($hovr_slk[:midsole_logo]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-midsole-logo-color"])
			expect($hovr_slk[:eva_midsole]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-hovr-eva-midsole-color"])
			expect($hovr_slk[:wrap]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-textile-wrap-color"])
			expect($hovr_slk[:outsole]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-outsole-color"])
			expect($hovr_slk[:pattern]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-heel-upper-overlay-pattern-colors"])
			expect($hovr_slk[:solid]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-heel-upper-overlay-solid-color"])
			expect($hovr_slk[:reinforcement]).to match_array(@hovr_slk_mens["uaf-fea-hovrslk-eyestay-reinforcement-color"])
		end
	end

	it "HOVR SLK WoMens" do 
		aggregate_failures "HOVR SLK WoMens" do
			@hovr_slk_womens = IconBasePage.localize_text_message_handles('uaf-prs-hovrslk-womens')
			# puts @hovr_slk_womens
			expect($hovr_slk[:heel]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-heel-counter-color"])
			expect($hovr_slk[:tongue]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-tongue-color"])
			expect($hovr_slk[:branding]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-tongue-branding-color"])
			expect($hovr_slk[:binding]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-collar-binding-color"])
			expect($hovr_slk[:lining_tongue]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-lining-tongue-backer-color"])
			expect($hovr_slk[:heel_lining]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-heel-lining-color"])
			expect($hovr_slk[:laces]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-laces-color"])
			expect($hovr_slk[:webbing]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-eyestay-webbing-color"])
			expect($hovr_slk[:eyestay]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-eyestay-tpu-color"])
			expect($hovr_slk[:thread]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-eyestay-thread-color"])
			expect($hovr_slk[:quarter]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-quarter-tpu-color"])
			expect($hovr_slk[:tab]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-heel-tab-color"])
			expect($hovr_slk[:midsole]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-upper-midsole-color"])
			expect($hovr_slk[:midsole_logo]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-midsole-logo-color"])
			expect($hovr_slk[:eva_midsole]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-hovr-eva-midsole-color"])
			expect($hovr_slk[:wrap]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-textile-wrap-color"])
			expect($hovr_slk[:outsole]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-outsole-color"])
			expect($hovr_slk[:pattern]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-heel-upper-overlay-pattern-colors"])
			expect($hovr_slk[:solid]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-heel-upper-overlay-solid-color"])
			expect($hovr_slk[:reinforcement]).to match_array(@hovr_slk_womens["uaf-fea-hovrslk-eyestay-reinforcement-color"])
		end
	end
end