require 'page-object'

class InitializerPage
	include PageObject
	
  def initialize
    super($driver)
  end
end