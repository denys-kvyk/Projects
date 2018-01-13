require_relative 'cart_component'
require_relative '../shopping_cart/shopping_cart_business'
require_relative '../shopping_cart/shopping_cart_atomic'

class CartAtomic

    attr_reader :cart

    def initialize(driver)
      @cart = CartComponent.new(driver)
    end

    def cart_button_text
      @cart.cart_button.text
    end

    def cart_button_click
      @cart.cart_button.click
      #ShoppingCartBusiness.new(ShoppingCartAtomic.new(browser.driver))
    end

end