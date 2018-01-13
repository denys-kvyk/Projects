require_relative '../data/application_source.rb'
require_relative '../data/application_source_repository.rb'
require_relative '../tools/browser_wrapper.rb'
#require_relative './user/home_page.rb'
#require_relative './user/shopping_cart.rb'
require_relative 'user/home_page/home_page_atomic'
require_relative 'user/home_page/home_page_business'
require_relative 'user/home_page/home_page'
require_relative 'user/cart_component/cart_atomic'
require_relative 'user/cart_component/cart_component'
require_relative 'user/cart_component/cart_business'
require_relative 'user/shopping_cart/shopping_cart_atomic'
require_relative 'user/shopping_cart/shopping_cart'
require_relative 'user/shopping_cart/shopping_cart_business'


class Application

  attr_reader :application_source, :browser

  private_class_method :new

  private

  @@instance = nil

  def initialize(application_source)
    @application_source = application_source
  end

  public



  def self.get(application_source = nil)
    if @@instance.nil?

      if application_source.nil?
        application_source = ApplicationSourceRepository.default

      end
      @@instance = new(application_source)
      @@instance.init(application_source)
    end
    return @@instance
  end

  def self.remove()
    if @@instance
      @@instance.browser.quit
      @@instance = nil
    end
  end

  def init(application_source)
    @browser = BrowserWrapper.new(application_source)
  end

  def load_home_page
    browser.open_url(application_source.baseUrl)
    #HomePage.new(browser.driver)
    HomePageBusiness.new(HomePageAtomic.new(browser.driver))

  end
  def load_main_page
    browser.open_url(application_source.baseUrl)
    #HomePage.new(browser.driver)
    ShoppingCartBusiness.new(ShoppingCartAtomic.new(browser.driver))

  end
=begin
  def login_user
    browser.open_url(application_source.userLoginUrl)
    # TODO change page
    HomePage.new(browser.driver)
  end

  def logout_user
    browser.open_url(application_source.userLogoutUrl)
    # TODO change page
    HomePage.new(browser.driver)
  end

  def login_admin
    browser.open_url(application_source.adminLoginUrl)
    # TODO change page
    HomePage.new(browser.driver)
  end

  def logout_admin
    browser.open_url(application_source.adminLogoutUrl)
    # TODO change page
    HomePage.new(browser.driver)
  end
=end
end
