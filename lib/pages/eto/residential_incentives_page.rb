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

####### => Part 5
# => AirSealing
text_field(:pre_cfm, id: "AIR_SEALING-PRECFM")
text_field(:post_cfm, id: "AIR_SEALING-POSTCFM")
text_field(:leakage_reduction, id: "AIR_SEALING-LEAKAGE_REDUCTION")
text_field(:seal_cost, id: "AIR_SEALING-SEALING_COST")
radio(:co_monitor_yes, id: "airSealCO_Yes")
radio(:co_monitor_no, id: "airSealCO_No")
# => Windows
text_field(:window_area_one, id: "WINDOWS-0.27-SQFT")
text_field(:window_quantity_one, id: "WINDOWS-0.27-Qty")
text_field(:window_area_two, name: "WINDOWS-0.30-SQFT")
text_field(:window_quantity_two, id: "WINDOWS-0.30-Qty")
text_field(:window_cost, id: "WINDOWS-INSTALLED_COST")
# => ProfInstalledInsulation
text_field(:attic_start_value, id: "ATTIC_INSULATION-BEGINR")
text_field(:attic_end_value, id: "ATTIC_INSULATION-ENDR")
text_field(:attic_cost, id: "ATTIC_INSULATION-INITIAL_COST")
text_field(:attic_sqft, id: "ATTIC_INSULATION-SQFT")
checkbox(:attic_filled, id: "ATTIC_INSULATION-FILLEDCAVITY")
text_field(:boiler_start_value, name: "BOILER_PLATE_INSULATION-BEGINR")
text_field(:boiler_end_value, id: "BOILER_PLATE_INSULATION-ENDR")
text_field(:boiler_cost, id: "BOILER_PLATE_INSULATION-INITIAL_COST")
text_field(:boiler_sqft, id: "BOILER_PLATE_INSULATION-SQFT")
text_field(:floor_start_value, id: "FLOOR_INSULATION-BEGINR")
text_field(:floor_end_value, id: "FLOOR_INSULATION-ENDR")
text_field(:floor_cost, id: "FLOOR_INSULATION-INITIAL_COST")
text_field(:floor_sqft, id: "FLOOR_INSULATION-SQFT")
checkbox(:floor_filled, id: "FLOOR_INSULATION-FILLEDCAVITY")
text_field(:kneewall_start_value, id: "KNEE_WALL_INSULATION-BEGINR")
text_field(:kneewall_end_value, id: "KNEE_WALL_INSULATION-ENDR")
text_field(:kneewall_cost, id: "KNEE_WALL_INSULATION-INITIAL_COST")
text_field(:kneewall_sqft, id: "KNEE_WALL_INSULATION-SQFT")
checkbox(:kneewall_filled, id: "KNEE_WALL_INSULATION-FILLEDCAVITY")
text_field(:joist_start_value, id: "RIM_JOIST_INSULATION-BEGINR")
text_field(:joist_end_value, id: "RIM_JOIST_INSULATION-ENDR")
text_field(:joist_cost, id: "RIM_JOIST_INSULATION-INITIAL_COST")
text_field(:joist_sqft, id: "RIM_JOIST_INSULATION-SQFT")
text_field(:wall_start_value, id: "WALL_INSULATION-BEGINR")
text_field(:wall_end_value, id: "WALL_INSULATION-ENDR")
text_field(:wall_cost, id: "WALL_INSULATION-INITIAL_COST")
text_field(:wall_sqft, id: "WALL_INSULATION-SQFT")
checkbox(:wall_filled, id: "WALL_INSULATION-FILLEDCAVITY")
text_field(:duct_start_value, id: "DUCT_INSULATION-BEGINR")
text_field(:duct_end_value, id: "DUCT_INSULATION-ENDR")
text_field(:duct_cost, id: "DUCT_INSULATION-INITIAL_COST")
text_field(:duct_sqft, id: "DUCT_INSULATION-SQFT")
checkbox(:duct_filled, id: "DUCT_INSULATION-DUCTSEAL-1")
# => GasUnitHeater
select_list(:previous_heating, id: "GAS_UNIT_HEATER-SYSREPL")
text_field(:heater_manufacturer, id: "GAS_UNIT_HEATER-MANUFACT")
text_field(:heater_serial, id: "GAS_UNIT_HEATER-SN")
text_field(:heater_model, id: "GAS_UNIT_HEATER-MODEL")
select_list(:heater_efficiency, id: "GAS_UNIT_HEATER-AFUE")
text_field(:heater_cost, id: "GAS_UNIT_HEATER-INSTALLED_COST")
# => GasFireplace
text_field(:fireplace_manufacturer, id: "GAS_FIREPLACE-MANUFACT")
text_field(:fireplace_serial, id: "GAS_FIREPLACE-SN")
text_field(:fireplace_model, id: "GAS_FIREPLACE-MODEL")
text_field(:fireplace_efficiency, id: "GAS_FIREPLACE-P4RATING")
text_field(:fireplace_cost, id: "GAS_FIREPLACE-INSTALLED_COST")
# => GasFurnace
select_list(:previous_furnace, id: "GAS_FURNACE-SYSREPL")
text_field(:furnace_manufacturer, id: "GAS_FURNACE-MANUFACT")
text_field(:furnace_serial, id: "GAS_FURNACE-SN")
text_field(:furnace_model, id: "GAS_FURNACE-MODEL")
select_list(:furnace_efficiency, id: "GAS_FURNACE-AFUE")
radio(:furnace_ecm_yes, id: "GAS_FURNACE-ECM-Yes")
radio(:furnace_ecm_no, id: "GAS_FURNACE-ECM-No")
text_field(:furnace_cost, id: "GAS_FURNACE-INSTALLED_COST")
# => SmartThermostat
select_list(:thermostat_model, id: "SMART_THERMOSTAT-MODEL")
text_field(:thermostat_cost, id: "SMART_THERMOSTAT-INSTALLED_COST")
# => GasTanklessWaterHeater
text_field(:tankless_manufacturer, id: "GAS_TANKLESS_WATER_HEATER-MANUFACT")
text_field(:tankless_serial, id: "GAS_TANKLESS_WATER_HEATER-SN")
text_field(:tankless_model, id: "GAS_TANKLESS_WATER_HEATER-MODEL")
select_list(:tankless_efficiency, id: "GAS_TANKLESS_WATER_HEATER-ENFACT")
text_field(:tankless_cost, id: "GAS_TANKLESS_WATER_HEATER-INSTALLED_COST")
# => InstantSavingsMeasures
select_list(:lightbulb_lamp, id: "INSTANT_SAVINGS_MEASURES-DILEDALAMP800-Qty")
select_list(:lightbulb_reflector, id: "INSTANT_SAVINGS_MEASURES-DILEDREFL800-Qty")
select_list(:kitchen_aerator_one, id: "INSTANT_SAVINGS_MEASURES-DIAER150KITCH-Qty")
select_list(:kitchen_aerator_two, id: "INSTANT_SAVINGS_MEASURES-DIAER200KITCH-Qty")
select_list(:bath_aerator_one, name: "INSTANT_SAVINGS_MEASURES-DIAER100BATH-Qty")
select_list(:bath_aerator_two, id: "INSTANT_SAVINGS_MEASURES-PI15WAARTRB13-Qty")
select_list(:showerhead_one, id: "INSTANT_SAVINGS_MEASURES-PI15WASHOWERG13-Qty")
select_list(:showerhead_two, id: "INSTANT_SAVINGS_MEASURES-DISHWR175GPM-Qty")
select_list(:showerwand, id: "INSTANT_SAVINGS_MEASURES-DISHWRWAND-Qty")
#### => Part 6
# => Document Upload
file_field(:upload_form, id: "uploadUtility-1")
# => Part 7
# => Terms and Conditions
checkbox(:customer_tc, id: "requiredHomeOwnerTCCheck")
checkbox(:contractor_tc, id: "requiredContractorTCCheck")
checkbox(:contractor_swr_tc, id: "requiredContractorSWRTCCheck")
checkbox(:contractor_mob_tc, id: "requiredContractorMOBTCCheck")
end