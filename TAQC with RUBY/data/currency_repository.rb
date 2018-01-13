require_relative 'currency.rb'
class CurrencyRepository

  private_class_method :new
  def self.currency_all_menu
    [Currency.new("EUR", "€ Euro"),
     Currency.new("GBP", "£ Pound Sterling"),
     Currency.new("USD", "$ US Dollar")]
  end

  def self.currency_euro
    currency_all_menu[0]
  end

  def self.currency_pound_sterling
    currency_all_menu[1]
  end

  def self.currency_dollar
    currency_all_menu[2]
  end

end

