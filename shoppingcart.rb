require './product.rb'

class Cart

  @@cart = []
  @@cart_hash = {}

  def self.checkcart
    @@cart_hash
  end


  def self.add_product(product_name, baseprice, taxrate)
    new_product = Product.new(product_name, baseprice, taxrate)
    @@cart << new_product
    if @@cart_hash[new_product]
      @@cart_hash[new_product] += 1
    else
      @@cart_hash[new_product] = 1
    end
    return new
  end


  def self.remove_product(product_to_remove)
    if @@cart.map {|each| each.product_name}.include? product_to_remove
      @@cart.each do |each_product|
        if each_product.product_name == product_to_remove
          puts "Removing one #{product_to_remove} from cart!"
          @@cart.delete(each_product)
        end
      end
    else puts "#{product_to_remove} not in cart!"
    end
  end

  def self.pretotal
    @@cart.map {|each| each.baseprice}.sum
  end

  def self.total_with_tax
    @@cart.map {|each| each.price}.sum
  end

  def self.most_expensive
    index_of_most_expensive = @@cart.map {|each| each.baseprice}.each_with_index.max[1] # base cost of most expensive item
    puts "The most expensive item in the cart is: #{@@cart.map {|each| each.product_name}[index_of_most_expensive]}"
  end
end

Cart.add_product("car",15000,1.04)
Cart.add_product("house",1000,1.04)
Cart.add_product("house",1000,1.04)
Cart.checkcart

Cart.remove_product("barbie")
Cart.remove_product("house")
puts
puts Cart.checkcart#.each {|product| puts product.product_name}

puts

puts Cart.pretotal
puts Cart.total_with_tax
puts Cart.most_expensive

# Add the ability to find the most expensive product in a cart.
# Allow a quantity to be associated with each product in the cart. What is the best way to store this information? How does it affect each of your other methods?
# Instead of storing the tax rate for each product, come up with a tax classification system (eg. standard, tax exempt, imported) so the rates are standardized across all products.
