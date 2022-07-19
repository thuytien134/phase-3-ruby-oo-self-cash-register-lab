require "pry"

class CashRegister
  attr_accessor :items, :total, :discount, :last_price, :last_quantity

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
    @last_quantity = 0
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    for value in 1..quantity
      self.items.push title
    end
    self.last_price = price
    self.last_quantity = quantity
  end

  def apply_discount
    if self.discount != 0
      self.total = @total - @total * @discount / 100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @last_price * @last_quantity

    if self.items.size == 0
      return self.total = @total - @total
    end
  end
end
