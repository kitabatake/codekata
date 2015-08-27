class DiscountSet

  attr_accessor :name, :discount_price, :discount_set_products

  def initialize (name, discount_price, discount_set_products)
    @name = name
    @discount_price = discount_price
    @discount_set_products = discount_set_products
  end

  def target? (account_products)

    rest_products_count = @discount_set_products.length

    @discount_set_products.each do |discount_set_product|

      account_products.each do |account_product|

        if account_product.product == discount_set_product.product && account_product.product_amount >= discount_set_product.product_amount
          rest_products_count -= 1
        end

      end
    end

    return rest_products_count == 0

  end

end

class DiscountSetProduct

  attr_accessor :product, :product_amount

  def initialize (product, product_amount)
    @product = product
    @product_amount = product_amount
  end

end