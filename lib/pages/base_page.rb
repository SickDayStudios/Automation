class BasePage
  include PageObject

  def initialize
    super($driver)
  end

  def wait_or_rescue(arg)
    begin
    self.wait_until { arg }
    rescue Watir::Wait::TimeoutError, Watir::Exception::UnknownObjectException, Timeout::Error
        BasePage.print_js_errors
    end
  end

  def self.print_js_errors
    log = $driver.driver.manage.logs.get(:browser)
    errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
    if errors.count > 0
      javascript_errors = errors.map(&:message).join("\n\n")
      puts "\nPageError:\n#{javascript_errors}"
      puts ""
    end
  end

  def self.raise_js_errors
    log = $driver.driver.manage.logs.get(:browser)
    errors = log.select{ |entry| entry.level.eql? 'SEVERE' }
    if errors.count > 0
      javascript_errors = errors.map(&:message).join("\n")
      raise javascript_errors
    end
  end

  def self.on_fail(example)
    if example.exception
      $driver.screenshot.save "#{@screenshotfolder}/fail-#{DateTime.now.strftime('%d%b%Y-%H%M%S')}.png"
    end
    self.print_js_errors
  end
  
  def self.resize_window
    $driver.window.resize_to(1920, 1080)
    $driver.window.move_to(0, 0)
  end

  def collect_links
    $driver.links
  end

  def self.url
    $driver.url
  end

  def self.go(path, secure)
    path = $base_url + path
    $driver.goto(secure ? "https://" + path : "http://" + path)
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

  def self.setup
    BasePage.set_user
    BasePage.set_base_url
    BasePage.resize_window
    BasePage.navigate_to_starting_page
  end


  def self.set_user
    case ENV['SITE'].to_sym
    when :gk
      case ENV['ENVIRONMENT'].to_sym
        when :staging
          case ENV['USER_TYPE'].to_sym
            when :consumer then $username = 'pollinatetest@gmail.com' and $password = 'iamquality'
            when :dealer then $username = 'pollinatetest+gkdealer@gmail.com' and $password = 'IamQuality!'
            when :distributor then $username = 'pollinatetest+gkdistributor@gmail.com' and $password = 'IamQuality!'
            when :salesrep then $username = 'pollinatetest+gksalesrep@gmail.com' and $password = 'IamQuality!'
            when :teamlead then $username = 'pollinatetest+gkteamdealer@gmail.com' and $password = 'IamQuality!'
          end
        when :prod
          case ENV['USER_TYPE'].to_sym
            when :consumer then $username = 'pollinatetest+gkconsumer@gmail.com' and $password = 'IamQuality!'
            when :dealer then $username = 'pollinatetest+gkdealer@gmail.com' and $password = 'IamQuality!'
            when :distributor then $username = 'pollinatetest+gkdistributor@gmail.com' and $password = 'IamQuality!'
            when :salesrep then $username = 'pollinatetest+gksalesrep@gmail.com' and $password = 'IamQuality!'
            when :teamlead then $username = 'pollinatetest+gkteamdealer@gmail.com' and $password = 'IamQuality!'
          end
      end
    end
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
        case ENV['ENVIRONMENT']
          when :staging then $base_url = 'https://staging.underarmour.com'
          when :prod then $base_url = 'https://www.underarmour.com/en-us/ua-icon-customized-shoes'
        end
      when :spectrum
        case ENV['ENVIRONMENT']
          when :dev then $base_url = 'https://dev.spectrumcustomizer.com/admin/' and $username = 'test_sa' and $password = 'SuperUser#1'
          when :staging then $base_url = 'http://demo.spectrumcustomizer.com/admin/' and $username = 'test_sa' and $password = 'SuperUser#1'
          when :prod then $base_url = 'http://demo.spectrumcustomizer.com/admin/' and $username = 'test_sa' and $password = 'SuperUser#1'
        end
      when :eto then $base_url = "https://forms.energytrust.org/esf"
      when :uau
        case ENV['ENVIRONMENT'].to_sym
          when :test then $base_url =  'http://demo.madetoordercustomizer.com/under-armour/test/uau/frontend/index.html#/materialIds/'
          when :staging then $base_url = 'http://demo.madetoordercustomizer.com/under-armour/staging/uau/frontend/index.html#/materialIds/'
          when :prod then $base_url = 'http://demo.madetoordercustomizer.com/under-armour/production/uau/frontend/index.html#/materialIds/'
        end
      when :preview then $base_url = 'http://preview.madetoordercustomizer.com/'
      when :eb
        case ENV['ENVIRONMENT'].to_sym
          when :prod then $base_url = 'http://api.spectrumcustomizer.com/eddie-bauer/shared/TQ2F6NWT'
          when :staging then $base_url = 'http://staging.spectrumcustomizer.com/eddie-bauer/share/TQ2F6NWT'
        end
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