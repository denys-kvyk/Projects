require 'selenium-webdriver'
require_relative '../header_component'
require_relative 'cart_selectors'

class CartComponent< HeaderComponent

  def initialize(driver)
    super(driver)
  end

  def cart_button
    @driver.find_element CartSelectors::CART
  end

end