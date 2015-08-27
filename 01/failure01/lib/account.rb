class Account

  def initialize
    @product_stock = []
    @product_set_stock = []
  end

  def add_product(product, amount)

    @product_stock.each do |stock|
      if stock[:product] == product
        stock[:amount] += amount
        return
      end
    end

    @product_stock.push :product => product, :amount => amount

  end

  def total_price
    price = 0
    @product_stock.each do |stock|
      price += stock[:product].calculate_price stock[:amount]
    end

    return price
  end

  def output_receipt

    buff = ""
    @product_stock.each do |stock|
      buff << stock[:product].output_receipt(stock[:amount])
    end

    return buff
  end

end