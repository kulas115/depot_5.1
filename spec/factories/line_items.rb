FactoryBot.define do
  factory :line_item do
    product
    cart
    order
  end
end
