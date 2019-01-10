
class CashRegister
  @@items = []
  attr_accessor :discount, :total, :new_item_price, :current_purchase

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @current_purchase = []
  end

  def items
    @@items[-1]
  end


  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @new_item_price = (price * quantity)
    self.total += @new_item_price
    counter = 0
    while counter < quantity
      @current_purchase << title
      counter +=1
    end
    @@items << @current_purchase
  end

  def apply_discount
    if self.discount > 0
      self.total -= ((self.discount / 100.00) * self.total)
      "After the discount, the total comes to $#{self.total.to_i}."
    elsif self.discount = 0
      "There is no discount to apply."

    end
  end

  def void_last_transaction
    self.total -= @new_item_price
  end
end
