require_relative '../data/product_repository.rb'
class PriceUtils

  def price(text)
    text.to_f
  end

  private_class_method :new


  def self.get_sum_price(product)
    suma=0.0
    product.each do |a|
          ProductRepository.get_price(a).each do |f|
             suma = suma+f.to_f
          end
    end

    suma
  end

  def self.price_by_text(text)
    text.delete! ','
    text[1, text.length-1].to_f
  end

  def self.sub_total_price a, b
    a=((a-b)/1.2).round(2)
    return a
  end

end

