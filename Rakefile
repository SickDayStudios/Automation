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


# => Accessibility

RSpec::Core::RakeTask.new(:accessibility, [:browser,:url,:standard]) do |t, args|
	ENV['BROWSER'] = args[:browser]
	ENV['URL'] = args[:url]
	ENV['STANDARD'] = args[:standard].to_sym
	ENV['TEST_ENV_NUMBER'] = "#{DateTime.now.strftime('%d%b-%H%M%S%p')}"
	t.pattern = Dir.glob('spec/tests/accessibility/accessibility_spec.rb')
end