require_relative 'shopping_cart'
require_relative 'shopping_cart_selectors'
require_relative '../cart_component/cart_atomic'
require_relative '../../../tools/price_utils.rb'
class ShoppingCartAtomic

  attr_reader :shopping_cart

  def initialize(driver)
    @shopping_cart = ShoppingCart.new(driver)
  #  @cart = CartAtomic.new(driver)
  end

  def product_row name
    @shopping_cart.products_in_cart_.each do |row|
      return row if row.text.include? name
    end
  end

  def product_name name
    product_row(name).find_element(css: ".text-left a")
  end

  def count_of_products name
    product_row(name).find_elements(css: ".text-right")
  end

  def product_count name
    count_of_products(name).each do |count|
      return count.text if count.text.include? 'x'
    end
  end

  def delete_product name
    product_row(name).find_element(css: ".text-center button")
  end

  #text

  def cart_body_text
    @shopping_cart.cart_body.text
  end

  def product_name_text name
    product_name(name).text
  end

  def product_count_text name
    count_of_products(name).each do |count|
      return count.text if count.text.include? 'x'
    end
  end

  def cart_sub_total_text
    @shopping_cart.cart_price_info[0].text
  end

  def cart_exo_tax_text
    @shopping_cart.cart_price_info[1].text
  end

  def cart_vat_text
    @shopping_cart.cart_price_info[2].text
  end

  def cart_total_text
     @shopping_cart.cart_price_info[3].text
  end

  # 2 cnopku TODO

  #click

  def click_delete_button name
    delete_product(name).click
  end

end