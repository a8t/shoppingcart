# Each product has a name, base price, and tax rate. There should also be a method to calculate and return the product's total price based on the base price and tax rate.

class Product


  attr_accessor :product_name, :baseprice

  def initialize(product_name, baseprice, taxrate)
    @product_name = product_name
    @baseprice = baseprice
    @taxrate = taxrate
  end

  def price
    @baseprice*@taxrate
  end
end
