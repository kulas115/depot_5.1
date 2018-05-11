require 'rails_helper'

RSpec.feature "Orders", type: :feature, js: true do
  scenario "user adds item to cart and then selects pay type on checkout screen" do
    product = FactoryBot.create(:product)

    visit root_path

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    expect(page).to_not have_selector('#order_routing_number')

    select 'Check', from: 'order[pay_type]'

    expect(page).to have_selector('#order_routing_number')
  end
end
