class Product

  attr_accessor :name, :price_per_amount, :amount, :unit

  def initialize (params = {})
    params.each {|p,v| send("#{p}=", v)}  
  end

  def calculate_price (num)
    num.to_f / @amount * @price_per_amount
  end

end
