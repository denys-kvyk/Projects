require 'selenium-webdriver'
require_relative '../header_component'
require_relative 'home_page_selectors'

class HomePage<HeaderComponent

  def initialize(driver)
    super(driver)
  end

  def home_page
    @driver.find_element HomePageSelectors::HOME_PAGE
  end

  def product_block
    @driver.find_elements HomePageSelectors::PRODUCT_BLOCK
  end

end