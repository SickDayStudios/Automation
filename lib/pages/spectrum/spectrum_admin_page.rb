class SpectrumAdminPage < BasePage
	include PageObject


# Clients
link(:icon, href: "#/ua-icon")
link(:eb, href: "#/eddie-bauer")
link(:wilson, href: "#/wilson")
link(:camelbak, href: "#/camelbak")
link(:ua, href: "#/under-armour")
link(:silhouette, href: "#/silhouette")
link(:gk, href: "#/gk-elite")
link(:uasm, href: "#/ua-sports-marketing")
link(:demo, href: "#/po-demo")
link(:benchmade, href: "#/benchmade")
link(:giro, href: "#/giro")
link(:leatherman, "#/leatherman")


#Icon Options
link(:icon_products, href: "#/ua-icon/products")


#Icon Products
text_field(:icon_product_search, id: "input_71")
link(:curry_one_men, href: "#/ua-icon/products/uaf-prs-curry1-mens")
link(:curry_two_men, href: "#/ua-icon/products/uaf-prs-curry25-mens")
link(:curry_one_youth, href: "#/ua-icon/products/uaf-prs-curry1-youth")
link(:curry_two_youth, href: "#/ua-icon/products/uaf-prs-curry25-youth")
link(:highlight_men, href: "#/ua-icon/products/uaf-prs-highlight-mens")
link(:clutchfit_men, href: "#/ua-icon/products/uaf-prs-clutchfit-mens")
link(:clutchfit_women, href: "#/ua-icon/products/uaf-prs-clutchfit-womens")
link(:current_item_selection, css: "body > div > div > div.ma-home__view.ma-cascading-drawers-container.ng-scope > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-1.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-2.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-3.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers__drawer.ma-cascading-drawers__drawer--index-3.ma-cascading-drawers__drawer--with-footer > form > md-list > md-list-item > div > a")


#Icon Derived Selections
link(:add_derived_slection, href: /add/)
button(:filters, css: "body > div > div > div.ma-home__view.ma-cascading-drawers-container.ng-scope > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-1.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-2.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-3.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-4.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-double > div > div.ma-cascading-drawers__drawer.ma-cascading-drawers__drawer--index-4.ma-cascading-drawers__drawer--with-footer.ma-cascading-drawers__drawer--double > div > button")
tr(:first_derived_selection, css: "body > div > div > div.ma-home__view.ma-cascading-drawers-container.ng-scope > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-1.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-2.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-3.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-single > div > div.ma-cascading-drawers.ng-scope.ma-cascading-drawers--index-4.ma-cascading-drawers--open.ma-cascading-drawers--parent-of-double > div > div.ma-cascading-drawers__drawer.ma-cascading-drawers__drawer--index-4.ma-cascading-drawers__drawer--with-footer.ma-cascading-drawers__drawer--double > md-content > md-table-container > table > tbody > tr:nth-child(1)")


# Create new Derived Selection
select(:when_feature, name: "whenFeature")
select(:has_selection, name: "hasSelection")
select(:then_feature, name: "thenFeature")
select(:then_selection, name: "thenSelection")


end