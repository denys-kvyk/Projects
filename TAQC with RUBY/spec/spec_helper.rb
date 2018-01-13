require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'allure-rspec'
require 'pathname'
require_relative '../pages/application.rb'

require_relative '../data/application_source_repository.rb'
require_relative '../data/currency.rb'
require_relative '../data/currency_repository.rb'
require_relative '../data/product.rb'
require_relative '../data/product_repository.rb'
require_relative '../tools/price_utils.rb'
require_relative '../tools/logger_wrapper'
#require_relative '../data/user_repository'

RSpec.configure do |config|

  config.include AllureRSpec::Adaptor


  $data_provider_product = ProductRepository.test_product_data

  $data_provider_total_price = PriceUtils.get_sum_price($data_provider_product)

  $data_provider_empty_cart="Your shopping cart is empty!"

  config.before(:all) do
    Application.get(ApplicationSourceRepository.firefox_heroku())
  end

  $log = LoggerWrapper.logger

  config.after(:all) do
    Application.remove
  end

  AllureRSpec.configure do |c|
    #c.output_dir = "/whatever/you/like" # default: gen/allure-results
    #c.clean_dir = false # clean the output directory first? (default: true)
    c.logging_level = Logger::WARN # logging level (default: DEBUG)
  end

end
