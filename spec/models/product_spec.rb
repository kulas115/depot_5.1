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

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.create(:product)}

  it { is_expected.to validate_presence_of :title}
  it { is_expected.to validate_uniqueness_of :title}
  it { is_expected.to validate_presence_of :description}
  it { is_expected.to validate_presence_of :image_url}
  it { is_expected.to allow_value('test.jpg').for(:image_url)}
  it { is_expected.to allow_value('test.png').for(:image_url)}
  it { is_expected.to allow_value('test.gif').for(:image_url)}
  it { is_expected.to_not allow_value('test.doc').for(:image_url)}
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
end
