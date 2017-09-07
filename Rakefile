# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'rake'
require 'rspec/core/rake_task'


ENV['CI_REPORTS'] = "./reports"

RSpec::Core::RakeTask.new(:gk, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/*_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_garments, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/garments/*_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_ecomm, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/*_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_url, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_url_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_products, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_product_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_signup, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_register_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_login, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_login_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_smoke, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_smoke_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_search, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_search_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:gk_checkout, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'gk'
t.pattern = Dir.glob('spec/tests/gkelite/gk-ecomm/gk_checkout_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end

RSpec::Core::RakeTask.new(:icon, [:environment, :browser]) do |t, args|
ENV['ENVIRONMENT'] = args[:environment]
ENV['BROWSER'] = args[:browser]
ENV['SITE'] = 'icon'
t.pattern = Dir.glob('spec/tests/icon/*_spec.rb')
t.rspec_opts = '--fail-fast=5 --color --require spec_helper --require rspec_junit_formatter --format documentation --format Fuubar --format html -o ./reports/test_results.html --format RspecJunitFormatter -o ./reports/test_results.xml'
end