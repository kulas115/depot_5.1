class ProductDecorator < Draper::Decorator
  delegate_all

  def price_in_dollar
    h.number_to_currency(object.price)
  end

end
