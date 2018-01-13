require_relative 'home_page'
require_relative 'home_page_selectors'

class HomePageAtomic

  attr_reader :home_page

  def initialize(driver)
    @home_page = HomePage.new(driver)
  end


  def product_div name
    @home_page.product_block.each do |div|
      return div if div.text.include? name
    end
  end

  def add_cart_button name
    product_div(name).find_element HomePageSelectors::ADD_BUTTON
  end

  def click_add_button name
    add_cart_button(name).click
  end

# business logic of page

  #def go_to_home_page
    #click_logo
    #HomePage new @driver
  #end
=begin
  def choose_currency_by_item(currency)

    case currency.name
      when CurrencyRepository.currency_euro.name

        choose_currency_euro
      when CurrencyRepository.currency_pound_sterling.name

        choose_currency_pound_sterling
      when CurrencyRepository.currency_dollar.name
        choose_currency_dollar
      else
        choose_currency_dollar
    end
  end
=end



  # TO DO wish list,.......

end