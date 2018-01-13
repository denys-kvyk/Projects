#!/bin/bash
rspec spec/test.rb
allure serve gen/allure-results/
#./