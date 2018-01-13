class ShoppingCartSelectors
  CART_BODY = {:css => ".dropdown-menu.pull-right"}
  SHOPPING_CART_PRODUCTS = {:css => "#cart .table-striped tr"}
  SHOPPING_CART_INFO = {:css => "#cart .table-bordered"}
  #DELETE_BUTTONS = {:xpath => "//*[@class='table table-striped']//tr[1]/td//*[@class='fa fa-times']"}
  PRICE_INFO = {:xpath => "//*[@class='table table-bordered']//tr/td[not(./strong)]"}
  CART_BUTTONS = {:xpath => "//p[@class='text-right']"}
end