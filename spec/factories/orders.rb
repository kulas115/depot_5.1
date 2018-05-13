# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  email      :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order do
    name "Roger Norville"
    address "Doo St."
    email "roger@norville.com"
    pay_type "Check"
  end
end
