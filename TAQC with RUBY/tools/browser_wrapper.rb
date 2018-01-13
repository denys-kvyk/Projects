require_relative '../data/application_source.rb'

class BrowserWrapper

  def initialize(application_source)
    init_browser(application_source)
  end

  private

  def init_browser(application_source)
    Selenium::WebDriver::Firefox.driver_path = application_source.driverPath
    # TODO Use factory method
    #@driver = Selenium::WebDriver.for :firefox
    options = Selenium::WebDriver::Firefox::Options.new(
       args: ['--headless']
    )
     options.add_argument('--headless')
    @driver = Selenium::WebDriver.for :firefox, options: options
    @driver.manage.timeouts.implicit_wait = application_source.implicitWaitTimeOut
  end

  public

  def driver
    @driver
  end

  def open_url url
       driver.get url
  end

  def navigate_forward
    driver.navigate.forward
  end

  def navigate_back
    driver.navigate.back
  end

  def refresh_page
    driver.navigate.refresh
  end

  def delete_cookies
    driver.manage.delete_cookies
  end

  def quit
    unless driver.nil?
      driver.quit
      @driver = nil
    end
  end

end
