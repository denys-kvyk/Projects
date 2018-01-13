require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'allure-rspec'
require 'pathname'
require_relative '../pages/application.rb'
require_relative '../data/product_repository.rb'
require_relative 'spec_helper.rb'

describe "Smoke test" do
    context "should check" do
      it "if the cars is empty" do
        $log.info "Smoke Test Started"
        expect(Application.get.load_main_page
                   .get_cart_body_text).to eql($data_provider_empty_cart)
        $log.info "Smoke Test Finished"
      end
    end
end