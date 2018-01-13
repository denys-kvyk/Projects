class Product
  attr_reader :name, :description, :prices, :price_no_vat
  
  def initialize(name, description, prices, price_no_vat)
    @name=name;
    @description=description;
    @prices=prices;
    @price_no_vat=price_no_vat
  end

  def prices_by_currency_item(currency)
    prices[currency.name]
  end

end
