require './lib/product.rb'
require './lib/discount_set.rb'
require './lib/account.rb'

tomato = Product.new({
  :name =>'tomato', 
  :price_per_amount => 100, 
  :amount => 1, 
  :unit => '個'
})

pork = Product.new({
  :name => 'pork', 
  :price_per_amount => 200, 
  :amount => 100, 
  :unit => 'g'
})


tomato_set = DiscountSet.new(
  'tomato three set',
  100,
  [
    DiscountSetProduct.new(tomato, 3)
  ]
)

Account.discount_sets = [tomato_set]

account = Account.new
account.add_product tomato, 3
account.add_product pork, 150
account.pickup_discount_set

puts account.output_receipt
puts "totail price is ¥" + account.total_price.to_s
