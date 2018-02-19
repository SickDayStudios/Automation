module GKSearchFilters
	include PageObject

	$gk_assets = ["1111",
				"1112",
				"1113",
				"1406",
				"1426",
				"1427",
				"1428",
				"1448",
				"1449",
				"1450",
				"1451",
				"1457",
				"1460",
				"1461",
				"1466",
				"1478",
				"1482",
				"1483",
				"1486",
				"1487",
				"1678",
				"1679",
				"1680",
				"1774",
				"1786",
				"1787",
				"1817",
				"1818",
				"1846",
				"1853",
				"1873",
				"1933",
				"1939",
				"1946",
				"1954",
				"1960",
				"1964",
				"1965",
				"1966",
				"2008",
				"2011",
				"2012",
				"3456",
				"3457",
				"3619",
				"3637",
				"3648",
				"3690",
				"3694",
				"3700",
				"3710",
				"3713",
				"3716",
				"3718",
				"3722",
				"3726",
				"3728",
				"3730",
				"3731",
				"3732",
				"3734",
				"3735",
				"3744",
				"3751",
				"3754",
				"3755",
				"3756",
				"3757",
				"3758",
				"3760",
				"3762",
				"3763",
				"3765",
				"3767",
				"3770",
				"3771",
				"3772",
				"3773",
				"3775",
				"3776",
				"3777",
				"3779",
				"3782",
				"3783",
				"3784",
				"3785",
				"3786",
				"3787",
				"3788",
				"3789",
				"3790",
				"3791",
				"3792",
				"3793",
				"3794",
				"3795",
				"3796",
				"3797",
				"3798",
				"3799",
				"3800",
				"3801",
				"3802",
				"3803",
				"3804",
				"3805",
				"3806",
				"3807",
				"3808",
				"3809",
				"3810",
				"3811",
				"3812",
				"3813",
				"3814",
				"3815",
				"3816",
				"3817",
				"3818",
				"3819",
				"3820",
				"4854",
				"4875",
				"4882",
				"4883",
				"4885",
				"4895",
				"6104",
				"6108",
				"6109",
				"6110",
				"6111",
				"6112",
				"6113",
				"6114",
				"6115",
				"6116",
				"6501",
				"6502",
				"6503",
				"6506",
				"6508",
				"6626",
				"6627",
				"6628",
				"6654",
				"6655",
				"6656",
				"6701",
				"6710",
				"6711",
				"6713",
				"6714",
				"7551",
				"7557",
				"7560",
				"7561",
				"7562",
				"7567",
				"7578",
				"7585",
				"7593",
				"7596",
				"7597",
				"7598",
				"7599",
				"7600",
				"7601",
				"7603",
				"7604",
				"7605",
				"7606",
				"7607",
				"7608",
				"7609",
				"7610",
				"7617",
				"7618",
				"7619",
				"7620",
				"7621",
				"7622",
				"7623",
				"7624",
				"7625",
				"7626",
				"7627",
				"7628",
				"7629",
				"7630",
				"7631",
				"8036",
				"8037",
				"8252",
				"8253",
				"8709",
				"8717",
				"8731",
				"8756",
				"8772",
				"8777",
				"8787",
				"8788",
				"8794",
				"8795",
				"8800",
				"8801",
				"8802",
				"9541",
				"9585",
				"9587",
				"9591",
				"9594",
				"9599",
				"9600",
				"9601",
				"9602",
				"9603",
				"9604",
				"9605",
				"9608",
				"9609",
				"9610",
				"9611",
				"9612",
				"9613",
				"9614",
				"9615S",
				"9616",
				"9617",
				"9618",
				"9619",
				"9620",
				"1101S",
				"1102S",
				"1103S",
				"1104S",
				"1105S",
				"1106S",
				"1107S",
				"1108S",
				"1109S",
				"1110S",
				"1700M",
				"1811M",
				"1812M",
				"1813M",
				"1817M",
				"1818M",
				"1832M",
				"1845M",
				"1846M",
				"1853ST",
				"1876M",
				"1877M",
				"1878M",
				"1879M",
				"1880M",
				"1881M",
				"1882M",
				"1883M",
				"1884M",
				"1885M",
				"1974S",
				"4885S",
				"4888S",
				"4892S",
				"4893S",
				"4894S",
				"4896S",
				"5841ST",
				"5844ST",
				"5845ST",
				"5846ST",
				"5847ST",
				"5848ST",
				"5849ST",
				"5850ST",
				"5851ST",
				"5852ST",
				"6509s",
				"6712s",
				"7560S",
				"7562S",
				"7578S",
				"7597S",
				"7600S",
				"7601S",
				"7603S",
				"7604S",
				"7605S",
				"7606S",
				"7607S",
				"7609S",
				"7611S",
				"7613S",
				"7616S",
				"7621S",
				"7622S",
				"7629S",
				"9601S",
				"9604S",
				"9608S",
				"9609S",
				"9615S",
				"BCA38",
				"BCA40",
				"BCA41",
				"CATGK17",
				"CATGM17",
				"CIR033",
				"CIR034",
				"CIR035",
				"CIR036",
				"CIR037",
				"CIR038",
				"DSY029",
				"DSY030",
				"DSY031",
				"DSY032",
				"DSY033",
				"DSY034",
				"DSY035",
				"DSY036",
				"DSY037",
				"DSY038",
				"DSY039",
				"DSY040",
				"DSY041",
				"DSY042",
				"DSY046",
				"DSY047",
				"DSY050",
				"DSY051",
				"DSY052",
				"E1323",
				"E2071",
				"E2259",
				"E2353",
				"E3277",
				"GK100",
				"GK101",
				"GK103",
				"GK26",
				"GK29",
				"GK32",
				"GK40",
				"GK49",
				"GK50",
				"GK56",
				"GK57",
				"GK88",
				"GK91",
				"L1037",
				"L1038",
				"L1048",
				"L1049",
				"L1051",
				"L1052",
				"N415",
				"N416",
				"N443",
				"SWU02",
				"SWU05",
				"SWU06",
				"SWU09",
				"SWU10",
				"SWU11",
				"wl355",
				"wl371",
				"wl374",
				"wl381",
				"wl382",
				"wl389",
				"wl397",
				"wl428",
				"wl440",
				"WL442"]

$collection_links = ["gk-gym-customizer-competition-shirts",
					"gk-gym-customizer-leotards",
					"gk-gym-customizer-pants-and-shorts",
					"gk-gym-customizer-warmups",
					"gk-gym-kids-accessories",
					"gk-gym-kids-catalog-back-to-school",
					"gk-gym-kids-leotard-collections-aly-raisman",
					"gk-gym-kids-leotard-collections-disney",
					"gk-gym-kids-leotard-collections-gkids",
					"gk-gym-kids-leotard-collections-laurie-hernandez",
					"gk-gym-kids-leotard-collections-nastia-liukin",
					"gk-gym-kids-leotard-collections-simone-biles",
					"gk-gym-kids-leotards",
					"gk-gym-kids-shorts",
					"gk-gym-men-accessories",
					"gk-gym-men-competition-shirts",
					"gk-gym-men-pants-and-shorts",
					"gk-gym-men-warmups",
					"gk-gym-women-accessories",
					"gk-gym-women-capris-and-leggings",
					"gk-gym-women-catalog-back-to-school",
					"gk-gym-women-leotard-collections-aly-raisman",
					"gk-gym-women-leotard-collections-breast-cancer-awareness",
					"gk-gym-women-leotard-collections-cirque-du-soleil",
					"gk-gym-women-leotard-collections-disney",
					"gk-gym-women-leotard-collections-gkids",
					"gk-gym-women-leotard-collections-laurie-hernandez",
					"gk-gym-women-leotard-collections-nastia-liukin",
					"gk-gym-women-leotard-collections-simone-biles",
					"gk-gym-women-leotards",
					"gk-gym-women-leotards-competitive",
					"gk-gym-women-leotards-training",
					"gk-gym-women-shorts",
					"gk-gym-women-warmups",
					"ua-gym-customizer-armourfuse",
					"ua-gym-customizer-competition-shirts",
					"ua-gym-customizer-leotards",
					"ua-gym-customizer-pants-and-shorts",
					"ua-gym-customizer-warmups",
					"ua-gym-men-accessories",
					"ua-gym-men-armourfuse",
					"ua-gym-men-coaches-apparel",
					"ua-gym-men-competition-shirts",
					"ua-gym-men-pants-and-shorts",
					"ua-gym-men-warmups",
					"ua-gym-women-accessories",
					"ua-gym-women-armourfuse",
					"ua-gym-women-capris-and-leggings",
					"ua-gym-women-coaches-apparel",
					"ua-gym-women-leotards",
					"ua-gym-women-leotards-competitive",
					"ua-gym-women-leotards-training",
					"ua-gym-women-shorts",
					"ua-gym-women-warmups"]


$two_d_products = ["1678", "1774", "1787", "2011", "2012", "3456", "3457", "3619", "3718", "3744", "3772", "3773", "3775", "3776", "3777", "3779", "3801", "3802", "3803", "3804", "3807", "3811", "3813", "3814", "3815", "3816", "3817", "3818", "3819", "3820","1700M", "1811M","1812M", "1813M", "1817M", "1853ST", "1883M", "1884M", "1885M", "5841ST", "5844ST", "5845ST", "5846ST", "5847ST", "5848ST", "5849ST", "5850ST", "5851ST", "5852ST", "E2071", "L1037", "L1038", "L1048", "L1049", "L1051", "L1052", "SWU02", "SWU06", "SWU10", "SWU11"]
end