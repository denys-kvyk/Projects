require 'selenium-webdriver'
require_relative '../cart_component/cart_component'
require_relative 'shopping_cart_selectors'


class ShoppingCart < CartComponent
  def initialize(driver)
    super(driver)
  end

  def cart_body
    @driver.find_element ShoppingCartSelectors::CART_BODY
  end

  def products_in_cart_
    @driver.find_elements ShoppingCartSelectors::SHOPPING_CART_PRODUCTS
  end

  def price_info_in_cart
    #sleep 1
    @driver.find_element ShoppingCartSelectors::SHOPPING_CART_INFO
  end

  def cart_buttons
    @driver.find_element ShoppingCartSelectors::CART_BUTTONS
  end

  def cart_price_info
    @driver.find_elements ShoppingCartSelectors::PRICE_INFO
  end

end