require_relative 'currency_repository.rb'
require_relative 'product.rb'
require_relative '../tools/parse_data'
require 'yaml'

class ProductRepository

  private_class_method :new

  TEST_PRODUCTS_DATA_PATH = './data/test_data.yaml'


  def self.default
    MacBook
  end

  def self.MacBook
    Product.new("MacBook",
                "Intel Core 2 Duo processor Powered by an Intel Core 2 Duo processor at speeds up to 2.1",
                {CurrencyRepository.currency_euro.name => "472.33",
                 CurrencyRepository.currency_pound_sterling.name => "368.73",
                 CurrencyRepository.currency_dollar.name => "602.00"},
                {CurrencyRepository.currency_euro.name => "392.30",
                 CurrencyRepository.currency_pound_sterling.name => "306.25",
                 CurrencyRepository.currency_dollar.name => "500.00"})

  end

  def self.IPhone
    Product.new("iPhone",
                "iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a nam",
                {CurrencyRepository.currency_euro.name => "96.66",
                 CurrencyRepository.currency_pound_sterling.name => "75.46",
                 CurrencyRepository.currency_dollar.name => "123.20"},
                {CurrencyRepository.currency_euro.name => "79.24",
                 CurrencyRepository.currency_pound_sterling.name => "61.86",
                 CurrencyRepository.currency_dollar.name => "101.00"})
  end


  def self.macbook_price
    assign_product_data_properties('Macbook')
  end

  def self.iphone_price
    assign_product_data_properties('iPhone')
  end

  def self.apple_cinema_price

  end

  def self.cannon_price

  end

  def self.get_price(product)
    case product
      when 'MacBook'
        macbook_price
      when 'iPhone'
        iphone_price
      else
        puts "Something wrong"
    end

  end

  def self.test_product_data
    assign_product_data_properties('products_to_be_add')
  end

  def self.assign_product_data_properties(_yaml_data_task)
    array = Array.new
    product_test_data(_yaml_data_task).each do |key, value|
      array<<value
    end
    array
  end

  def self.product_test_data(_yaml_data_id)
    ParseData.parsed_yaml_file_data(TEST_PRODUCTS_DATA_PATH)[_yaml_data_id]
  end


end
