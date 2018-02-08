# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'rake'
require 'rspec/core/rake_task'
require 'date'

ENV['CI_REPORTS'] = "./reports"

RSpec::Core::RakeTask.new(:icon, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'ua-icon'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/icon/icon_product_spec.rb')
end

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

RSpec::Core::RakeTask.new(:preview, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'preview'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/preview_error_spec.rb')
end

# RSpec::Core::RakeTask.new(:accessibility, [:browser]) do |t, args|
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/accessibility/accessibility_spec.rb')
# end

# RSpec::Core::RakeTask.new(:cb_social, [:environment, :browser]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['SITE'] = 'camelbak'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/cb/cb_share_spec.rb')
# end

# RSpec::Core::RakeTask.new(:ios, [:deviceName, :deviceType, :platformName, :platformVersion, :app]) do |t, args|
# 	ENV['deviceName'] =	args[:deviceName]
# 	ENV['deviceType='] = args[:deviceType]
# 	ENV['platformName'] = args[:platformName]
# 	ENV['platformVersion'] = args[:platformVersion]
# 	ENV['app'] = args[:app] 
# end

# RSpec::Core::RakeTask.new(:icon_products, [:environment, :browser]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['SITE'] = 'ua-icon'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/icon/icon_product_spec.rb')
# end

# RSpec::Core::RakeTask.new(:icon, [:environment, :browser]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['SITE'] = 'ua-icon'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/icon/*_spec.rb')
# end

# RSpec::Core::RakeTask.new(:eb, [:environment, :browser]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['SITE'] = 'eddie-bauer'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/eb/eb_smoke_spec.rb')
# end

# RSpec::Core::RakeTask.new(:uau, [:environment, :browser]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['SITE'] = 'under-armour'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/uau/*_spec.rb')
# end




# => 	############# GKELITE ################



# RSpec::Core::RakeTask.new(:gk, [:environment, :browser, :user]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['USER_TYPE'] = args[:user]
# 	ENV['SITE'] = 'gk-elite'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/gkelite/*_spec.rb')
# end

# RSpec::Core::RakeTask.new(:gk_garments, [:environment, :browser, :user]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['USER_TYPE'] = args[:user]
# 	ENV['SITE'] = 'gk-elite'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/gkelite/garments/*_spec.rb')
# end

# RSpec::Core::RakeTask.new(:gk_ecomm, [:environment, :browser, :user]) do |t, args|
# 	ENV['ENVIRONMENT'] = args[:environment]
# 	ENV['BROWSER'] = args[:browser]
# 	ENV['USER_TYPE'] = args[:user]
# 	ENV['SITE'] = 'gk-elite'
# 	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
# 	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/*_spec.rb')
# end

RSpec::Core::RakeTask.new(:gk_url, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_url_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_products, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_product_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_ao, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['SITE'] = 'customizer'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_ao_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_signup, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_register_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_login, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_login_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_smoke, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_smoke_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_search, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_search_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_checkout, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_checkout_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_two_d, [:environment, :browser, :user]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['USER_TYPE'] = args[:user]
	ENV['SITE'] = 'gk-elite'
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/ecomm/gk_two_d_spec.rb')
end

RSpec::Core::RakeTask.new(:gk_api, [:environment, :browser]) do |t, args|
	ENV['ENVIRONMENT'] = args[:environment]
	ENV['BROWSER'] = args[:browser]
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/gkelite/gk_asset_api_spec.rb')
end