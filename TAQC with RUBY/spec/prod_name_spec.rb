require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'allure-rspec'
require 'pathname'
require_relative '../pages/application.rb'
require_relative '../data/product_repository.rb'
require_relative 'spec_helper.rb'

describe "Products from HOME page" do
  context "should be added to the cart and" do
    it " their names should be right" do
      $log.info "Add product to cart and check names Test Started"
      expect(Application.get.load_home_page
                 .add_all_product_to_cart($data_provider_product)
                 .get_all_product_names($data_provider_product)).to eql($data_provider_product)
      $log.info "Add product to cart and check names Test Finished"
    end
  end

end
