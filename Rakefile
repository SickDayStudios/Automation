# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'rake'
require 'rspec/core/rake_task'
require 'date'

ENV['CI_REPORTS'] = "./reports"



# Schema

RSpec::Core::RakeTask.new(:schema, [:browser]) do |t, args|
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/svg_validator_spec.rb')
end


# DEMO

RSpec::Core::RakeTask.new(:demo, [:browser]) do |t, args|
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/demo/demo_spec.rb')
end


# Timex

RSpec::Core::RakeTask.new(:timex, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'ua-icon'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/timex/timex_customizer_spec.rb')
end


# ICON

RSpec::Core::RakeTask.new(:icon_fe, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'ua-icon'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/icon/icon_product_spec.rb')
end

RSpec::Core::RakeTask.new(:icon_ber, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'ua-icon'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/icon/icon_ber_spec.rb')
end

RSpec::Core::RakeTask.new(:icon_palette, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'ua-icon'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/icon/icon_palette_spec.rb')
end

RSpec::Core::RakeTask.new(:icon_perf, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'ua-icon'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/icon/icon_performance_spec.rb')
end






# BENCHMADE

RSpec::Core::RakeTask.new(:bmk_cart, [:environment,:browser]) do |t, args|
	ENV['BROWSER'] = args[:browser]
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['SITE'] = 'benchmade'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/bmk/bmk_cart_spec.rb')
end

RSpec::Core::RakeTask.new(:bmk_xml, [:environment,:browser]) do |t, args|
	# ENV['SITE'] = 'benchmade'
	ENV['BROWSER'] = args[:browser]
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/bmk/bmk_generate_recipe_spec.rb')
end








# 3D/Data

RSpec::Core::RakeTask.new(:api, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/asset_api_spec.rb')
end

RSpec::Core::RakeTask.new(:manifest, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/manifest_model_shader_spec.rb')
end







# B2B

RSpec::Core::RakeTask.new(:preview, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'preview'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/preview_error_spec.rb')
end




# => Accessibility

RSpec::Core::RakeTask.new(:accessibility, [:browser]) do |t, args|
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/accessibility/accessibility_spec.rb')
end




# => GKELITE 


RSpec::Core::RakeTask.new(:gk_opts, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_options_spec.rb')
end


RSpec::Core::RakeTask.new(:gk_url, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_url_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_products, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_product_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_ao, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'customizer'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_ao_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_signup, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_register_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_login, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_login_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_smoke, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_smoke_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_search, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_search_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_checkout, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_checkout_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_two_d, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_two_d_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_api, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_asset_api_spec.rb')
end