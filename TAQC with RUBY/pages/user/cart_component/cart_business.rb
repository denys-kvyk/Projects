require_relative '../header_component'
require 'selenium/webdriver'
require_relative 'cart_component'
require_relative 'cart_atomic'

class CartBusiness
  attr_reader :cart_atomic

  def initialize(cart_atomic)
    @cart_atomic = cart_atomic
  end

  def check_cart
    @cart_atomic.cart_button_click
    #Cart.new @driver
  end


end