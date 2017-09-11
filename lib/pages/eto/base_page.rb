require 'page-object'

class BasePage
  include PageObject

  def initialize
    super($driver)
  end

  def self.maximize_window
    $driver.window.maximize
  end

  def self.quit_webdriver
    $driver.quit
  end
end