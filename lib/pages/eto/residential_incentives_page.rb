require "lib/pages/base_page"
require 'page-object'

class ResidentialIncentives < BasePage
	include PageObject

#homeowner
radio(:homeowner, id: "rblWhoAreYou_1")
radio(:hired_contractor, id: "rblWhoInstalled_1")
radio(:work_myself, id: "rblWhoInstalled_2")

#trade ally
radio(:trade_ally, id: "rblWhoAreYou_2")
radio(:general_incentive, id: "rblContractorTrack_General")
radio(:energy_star_incentive, id: "rblContractorTrack_HP")
radio(:manufactured_incentive, id: "rblContractorTrack_Mobes")
radio(:reach_incentive, id: "rblContractorTrack_SWR")
checkbox(:instant_incentive, id: "hp_ta_instant_incentives_app")
text_field(:company_name, id: "hp_contractor_select")
text_field(:trade_ally_email, id: "hp_ta_contact_email")

#links
link(:continue, class: "nextSection")
link(:back, class: "previousSection")
link(:smart_thermostat, href: "https://energytrust.org/forms/residential/tstat")


#homeowner info form
text_field(:first_name, id: "customer-firstName")
text_field(:last_name, id: "customer-lastName")
text_field(:email, id: "customer-email")
text_field(:area_code_primary, id: "customer-area1")
text_field(:first_three_primary, id: "customer-firstthree1")
text_field(:last_four_primary, id: "customer-lastfour1")
text_field(:area_code_secondary, id: "customer-area2")
text_field(:first_three_secondary, id: "customer-firstthree2")
text_field(:last_four_secondary, id: "customer-lastfour2")
text_field(:address, id: "customer-siteAddress")
text_field(:city, id: "customer-siteCity")
text_field(:zip, id: "customer-siteZip")
radio(:state_or, id: "siteStateOR")
radio(:state_wa, id: "siteStateWA")
radio(:different_address_yes, id: "sameAddress_yes")
radio(:different_address_no, id: "sameAddress_no")
radio(:manufactured_yes, id: "manufacturedProperty_yes")
radio(:manufactured_no, id: "manufacturedProperty_no")
radio(:multifamily_yes, id: "multifamilyProperty_yes")
radio(:multifamily_no, id: "multifamilyProperty_no")
radio(:utilities_yes, id: "servicedByAffiliatedProviders_yes")
radio(:utilities_no, id: "servicedByAffiliatedProviders_no")


#mailing address form
text_field(:mail_address, id: "customer-mailAddress")
text_field(:mail_city, id: "customer-mailCity")
list_items(:state, css: "#mailAddress > ul > li:nth-child(3) > div > div.selectric-items > div > ul")
text_field(:mail_zip, id: "customer-mailZip")

#utility providers form
list_items(:electricity, css: "#part3 > ul.module-form__fields > li.module-form__field__half-content > div:nth-child(1) > div > div.selectric-items > div > ul")
list_items(:gas, css: "#part3 > ul.module-form__fields > li.module-form__field__half-content > div:nth-child(2) > div > div.selectric-items > div > ul")
radio(:rental_yes, id: "rentalProperty_yes")
radio(:rental_no, id: "rentalProperty_no")
text_field(:year_built, id: "site-circa")
text_field(:square_feet, id: "site-sqft")
text_field(:floors, id: "site-floors")
list_items(:housing_type, css: "#manufacturedHomesType > div > div > div.selectric-items > div > ul")
list_items(:heating_system, css: "#installationAddressHeatingInformation > ul > li:nth-child(1) > div:nth-child(1) > div > div.selectric-items > div > ul")
list_items(:heating_fuel, css: "#installationAddressHeatingInformation > ul > li:nth-child(1) > div:nth-child(2) > div > div.selectric-items > div > ul")
list_items(:basement_type, css: "#basementTypeQuestion > div > div > div.selectric-items > div > ul")
radio(:heating_update_no, id: "heatingSystemUpdate_No")
radio(:heating_update_yes, id: "heatingSystemUpdate_Yes")
radio(:heating_update_idk, id: "heatingSystemUpdate_DontKnow")
radio(:secondary_heating_no, id: "secondHeatingSystem_No")
radio(:secondary_heating_yes, id: "secondHeatingSystem_Yes")
list_items(:secondary_heating_fuel, css: "#siteSecondHeatFuelQuestion > div > div > div.selectric-items > div > ul")
radio(:combustion_yes, id: "combustionAppliance_Yes")
radio(:combustion_no, id: "combustionAppliance_No")
text_field(:installation_date, id: "INSTALL_DATE")
text_field(:promo_code, id: "promoCodeInput")

#Weatherization Incentive checkboxes
checkbox(:air_leakage, id: "incentivechoice-AirLeakageTest")
checkbox(:assessment, id: "incentivechoice-ComprehensiveAssessment")
checkbox(:air_sealing, id: "incentivechoice-AirSealing")
checkbox(:duct_leakage, id: "incentivechoice-DuctLeakageTest")
checkbox(:duct_repair, id: "incentivechoice-ComplexDuct")
checkbox(:windows, id: "incentivechoice-Windows")
checkbox(:duct_sealing, id: "incentivechoice-DuctSealing")
checkbox(:self_insulation, id: "incentivechoice-SelfInstalledInsulation")
checkbox(:pro_insulation, id: "incentivechoice-ProfInstalledInsulation")

#HVAC Incentive checkboxes
checkbox(:gas_boiler, id: "incentivechoice-GasBoiler")
checkbox(:gas_unit, id: "incentivechoice-GasUnitHeater")
checkbox(:heat_pump, id: "incentivechoice-HeatPump")
checkbox(:gas_fireplace, id: "incentivechoice-GasFireplace")
checkbox(:ductless_heat, id: "incentivechoice-DuctlessHeatPump")
checkbox(:gas_furnace, id: "incentivechoice-GasFurnace")
checkbox(:rental_furnace, id: "incentivechoice-GasFurnaceRental")

#Controls and Commissioning Incentive checkboxes
checkbox(:heatpump_adv_ctrl, id: "incentivechoice-HeatPumpAdvControl")
checkbox(:heatpump_lockout_ctrl, id: "incentivechoice-NewHeatPumpLockoutControls")
checkbox(:heatpump_optimized, id: "incentivechoice-HeatPumpOptimization")
checkbox(:smart_thermostat, id: "incentivechoice-SmartThermostat")

# Water-based Incentive checkboxes
checkbox(:pump_water_heater, id: "incentivechoice-HeatPumpWaterHeater")
checkbox(:gas_water_heater, id: "incentivechoice-GasTankWaterHeater")
checkbox(:electric_water_heater, id: "incentivechoice-ElectricWaterHeater")
checkbox(:water_treatment, id: "incentivechoice-AlternativeOnSiteWastewaterTreatmentSystem")
checkbox(:outdoor_spa, id: "incentivechoice-OutdoorSpaCover")
checkbox(:pool_pump, id: "incentivechoice-PoolPumpInstallation")

#Instant Savings Measure checkboxes
checkbox(:instant_savings, id: "incentivechoice-InstantSavingsMeasures")

# Other Incentive checkbox
checkbox(:travel_incentive, id: "incentivechoice-TravelIncentive")

# Multiupgrade Incentive checkbox
checkbox(:multiupgrade_incentive, id: "incentivechoice-MultiUpgradeIncentive")

# incentive details
span(:incentive_estimate, id: "customerTotalSpan")

# contractors
link(:add_contractor, id: "addAnotherContractor")
list_item(:contractor_one, id: "self_contractor-1")
list_item(:contractor_two, id: "self_contractor-2")
list_item(:contractor_three, id: "self_contractor-3")
list_item(:contractor_four, id: "self_contractor-4")
list_item(:contractor_five, id: "self_contractor-5")
list_item(:contractor_six, id: "self_contractor-6")
list_item(:contractor_seven, id: "self_contractor-7")
list_item(:contractor_eight, id: "self_contractor-8")
list_item(:contractor_nine, id: "self_contractor-9")


end