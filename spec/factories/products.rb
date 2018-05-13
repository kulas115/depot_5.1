# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :product do
    title "Programming Ruby 1.9"
    description "Ruby is the fastest growing and most exciting dynamic​ language out there. If you need to get working programs​ ​delivered fast, you should add Ruby to your toolbox.​"
    price "49.50"
    image_url "rails.png"
  end

  factory :product_second do
    title "Programming Ruby 2.4"
    description "Ruby is the fastest growing and most exciting dynamic​ language out there. If you need to get working programs​ ​delivered fast, you should add Ruby to your toolbox.​"
    price "49.50"
    image_url "rails.png"
  end

  factory :product_decorated do
    initialize_with { new.decorate }
    title "Programming Ruby 1.9"
    description "Ruby is the fastest growing and most exciting dynamic​ language out there. If you need to get working programs​ ​delivered fast, you should add Ruby to your toolbox.​"
    price "49.50"
    image_url "rails.png"
  end
end
