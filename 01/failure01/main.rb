require './lib/product.rb'
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


tomato_set = ProductSet.new({
  :name => 'tomato three set',
  :price => 250,
  :products => [
    {:product => tomato, :amount => 3}
  ]
})

account = Account.new
account.add_product tomato, 2

p account.output_receipt
p account.total_price
