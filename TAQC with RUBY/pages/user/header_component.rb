class HeaderComponent
  attr_reader :driver
  # page object get webelements
  NAVIGATION_PANEL = {:id => "top"}
  MACBOOK = {css: ".product-layout:first-child button:first-child"}
  CURRENCY = {:css => ".btn.btn-link.dropdown-toggle"}
  CURRENCY_OPTIONS = {:css => ".btn.btn-link.dropdown-toggle + ul > li > button"}
  DOLLAR = {:name => "USD"}
  EURO = {:name => "EUR"}
  POUND = {:name => "GBP"}
  MY_ACCOUNT = {:css => ".list-inline > li > a.dropdown-toggle"}
  MY_ACCOUNT_LOGIN = {:css => ".list-inline > li > a.dropdown-toggle + ul > li:first-child > a"}
  MY_ACCOUNT_REGISTER = {:css => ".list-inline > li > a.dropdown-toggle + ul > li:last-child > a"}
  WISH_LIST = {:id => "wishlist-total"}
  SHOPPING_CART = {:css => "a[title='Shopping Cart']"}
  LOGO = {:css => "#logo > a"}
  SEARCH_PRODUCT_FIELD = {:name => "search"}
  SEARCH_PRODUCT_BUTTON = {:css => ".btn.btn-default.btn-lg"}
  SHOPPING_CART_BLOCK = {:css => "#cart > button"}



  def initialize(driver)
    @driver = driver
  end
  def navigation_panels
    @driver.find_element NAVIGATION_PANEL
  end

  def currency
    @driver.find_element CURRENCY
  end
  def currency_options
    @driver.find_elements CURRENCY_OPTIONS
  end
  def currency_dollar
    click_navigation_panel
    click_currency
    @driver.find_element DOLLAR
  end

  def currency_euro
    click_navigation_panel
    click_currency
    @driver.find_element EURO
  end

  def macbook
    @driver.find_element MACBOOK
  end

  def currency_pound
    click_navigation_panel
    click_currency
    @driver.find_element POUND
  end

  def my_account
    #TODO if link is already displayed
    #add click somewhere else to close it
    @driver.find_element MY_ACCOUNT
  end

  def my_account_login
    @driver.find_element MY_ACCOUNT_LOGIN
  end

  def my_account_register
    @driver.find_element MY_ACCOUNT_REGISTER
  end

  def wish_list
    @driver.find_element WISH_LIST
  end

  def shopping_cart
    @driver.find_element SHOPPING_CART
  end

  def logo
    @driver.find_element LOGO
  end

  def search_product_field
    @driver.find_element SEARCH_PRODUCT_FIELD
  end

  def search_product_button
    @driver.find_element SEARCH_PRODUCT_BUTTON
  end

  def shopping_cart_block
    @driver.find_element SHOPPING_CART_BLOCK
  end

  # page object get text
  def shooping_cart_block_item_count_text
    shopping_cart_block.text[0,1]
  end

  # page object atomic set text
  def text_search_product_field text
    search_product_field.send_keys text
  end
  # page object atomic set clear

  def clear_search_product_field
    search_product_field.clear
  end
  # page object atomic set click

  def click_navigation_panel
    navigation_panels.click
  end

  def click_currency
    currency.click
  end

  def click_my_account
    my_account.click
  end

  def click_wish_list
    wish_list.click
  end

  def click_shopping_cart
    shopping_cart.click
  end

  def click_logo
    logo.click
  end

  def click_search_product_button
    search_product_button.click
  end

  def click_get_drop_down_by_name dropdown_list, option
    get_drop_down_by_name dropdown_list, option
  end

  def click_shopping_cart_block
    shopping_cart_block.click
    LoggerWrapper.logger.info "Cart button clicked"
    sleep 1
    #ShoppingCartBusiness.new(ShoppingCartAtomic.new(@home_page_atomic.home_page.driver))

  end

  def click_currency_dolar
    currency_dollar.click
  end

  def click_currency_euro
    currency_euro.click
  end

  def click_currency_pound
    currency_pound.click
  end

  def click_macbook
    macbook.click
  end


  #TODO
  def click_my_account_option_login
    click_my_account.each do |value|
      if (value.text) == "Login"
        @result = value
        break
      end
    end
    @result.click
  end

  #TODO
  def click_my_account_option_register
    click_my_account.each do |value|
      if (value.text) == "Register"
        @result = value
        break
      end
    end
    @result.click
  end

  #TODO
  def get_drop_down_by_name(dropdown_list, option)
    dropdown_list.each do |value|
      if ((value.text) == option)
        @result = value
        break
      end
    end
    @result
  end

  # business logic of page



  def choose_curency_euro
    click_currency_euro
    HomePage.new @driver
  end

  def choose_curency_pound
    click_currency_pound
    HomePage.new @driver
  end

  def choose_curency_dollar
    click_currency_dolar
    HomePage.new @driver
  end
  def go_to_login_from_my_account
    click_my_account_option_login
    LoginPage.new
  end

  def go_to_register_from_my_account
    click_my_account_option_register
    RegistrationPage.new
  end





end
