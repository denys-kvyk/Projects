require 'rubygems'
require 'selenium-webdriver'
require "test/unit"
require_relative '../data/application_source_repository.rb'
require_relative '../data/currency.rb'
require_relative '../data/currency_repository.rb'
require_relative '../data/product.rb'
require_relative '../data/product_repository.rb'
require_relative '../pages/application.rb'
require_relative '../pages/user/home_page.rb'
require_relative '../pages/user/item_list_component.rb'

class OppenCart < Test::Unit::TestCase




  def setup
    Application.get(ApplicationSourceRepository.firefox_heroku)
  end

  def teardown
    Application.remove
  end

  def test_oppen_cart_page_obj2 #(product, currency)

    product = ProductRepository.IPhone.name
    p product
    currency = CurrencyRepository.currency_dollar
    Application.get.load_home_page
               .click_add_cart_button(product)

    sleep 3

  end

end

# Test BAD. Mixed
# Logic of Test;
# Using engine Selenium
# Selectors
# Test Data
#
# Must be
# Application.start.gotoMainPage.choose(Dollar)
# Check price HomePage.getPrice(MacBook)
