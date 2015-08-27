class Account

  @@discount_sets = []

  def self.discount_sets= (discount_sets)
    @@discount_sets = discount_sets
  end

  def initialize
    @account_products = []
    @target_discount_sets = []
  end

  def add_product(product, amount)

    @account_products.each do |account_product|
      if account_product.product == product
        account_product.product_amount += amount
        return
      end
    end

    @account_products.push AccountProduct.new product, amount
  end

  def pickup_discount_set

    @@discount_sets.each do |discount_set|
      @target_discount_sets.push(discount_set) if discount_set.target? (@account_products)
    end
  end

  def total_price
    price = 0
    @account_products.each do |account_product|
      price +=  account_product.price
    end

    @target_discount_sets.each do |target_discount_set|
      price -= target_discount_set.discount_price
    end

    return price
  end

  def output_receipt

    buff = "=== receipt ===\n"
    @account_products.each do |account_product|
      buff << account_product.output_receipt + "\n"
    end

    @target_discount_sets.each do |target_discount_set|
      buff << "#{target_discount_set.name}   -¥#{target_discount_set.discount_price}\n"
    end

    return buff << "==============="
  end

end

class AccountProduct

  attr_accessor :product, :product_amount

  def initialize(product, amount)
    @product = product
    @product_amount = amount
  end

  def price
    @product.calculate_price @product_amount
  end

  def output_receipt
    return "#{@product.name} * #{@product_amount} #{@product.unit}   ¥#{price}"
  end

end

