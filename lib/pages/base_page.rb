require 'page-object'

class BasePage
  include PageObject

  def initialize
    super($driver)
  end
  
  def self.resize_window
    $driver.window.resize_to(1920, 1200)
    $driver.window.move_to(0, 0)
  end

  def self.url
    $driver.url
  end

  def self.go(path, secure)
    path = $base_url + path
    $driver.goto(secure ? "https://" + path : "http://" + path)
  end

  def print_js_errors
    log = $driver.driver.manage.logs.get('browser')
    errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
    if errors.count > 0
      javascript_errors = errors.map(:message).join("\n")
      raise javascript_errors
    end
  end

  def self.navigate_to_starting_page
    $driver.goto $base_url
  end

  def self.maximize_window
    $driver.window.maximize
  end

  def self.quit_webdriver
    $driver.quit
  end

  def self.set_base_url
    case ENV['SITE'].to_sym
    when :gk
      case ENV['ENVIRONMENT'].to_sym
      when :dev then $base_url = 'https://dev-gkelite.pollinate.com'
      when :test then $base_url = 'https://test-gkelite.pollinate.com'
      when :staging then $base_url = 'https://staging-gkelite.pollinate.com'
      when :prod then $base_url = 'https://preview.gkelite.com'
      end
    when :icon
      case ENV['ENVIRONMENT'].to_sym
      when :dev then $base_url = 'https://www.underarmour.com/en-us/ua-icon-customized-shoes'
      when :test then $base_url = 'https://www.underarmour.com/en-us/ua-icon-customized-shoes'
      when :staging then $base_url = 'https://www.underarmour.com/en-us/ua-icon-customized-shoes'
      when :prod then $base_url = 'https://www.underarmour.com/en-us/ua-icon-customized-shoes'
      end
      # when :icon
      #   case ENV['ENVIRONMENT']
      #     when :dev then $base_url =
      #     when :staging then $base_url =
      #     when :prod then $base_url =
      # end
      # when :cb
      #   case ENV['ENVIRONMENT']
      #     when :dev then $base_url =
      #     when :staging then $base_url =
      #     when :prod then $base_url =
      # end
      # when :eb
      #   case ENV['ENVIRONMENT']
      #     when :dev then $base_url =
      #     when :staging then $base_url =
      #     when :prod then $base_url =
      # end
      # when :b2c
      #   case ENV['ENVIRONMENT']
      #     when :dev then $base_url =
      #     when :staging then $base_url =
      #     when :prod then $base_url =
      # end
    end
  end
end