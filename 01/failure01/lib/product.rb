class Product

  attr_accessor :name, :price_per_amount, :amount, :unit

  def initialize (params = {})
    params.each {|p,v| send("#{p}=", v)}  
  end

  def calculate_price (num)
    num.to_f / @amount * @price_per_amount
  end

  def output_receipt (num)
    return "#{@name} * #{num} #{@unit} - ¥#{calculate_price(num)}"
  end
end


class ProductSet

  attr_accessor :name, :price, :products

  def initialize (params = {})
    params.each {|p,v| send("#{p}=", v)}  
  end

  def calculate_price (num)
    @price * num
  end

end