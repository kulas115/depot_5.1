require 'rails_helper'

RSpec.feature "Orders", type: :feature, js: true do
  include ActiveJob::TestHelper
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

    fill_in 'Routing #', with: "123456"
    fill_in 'order[account_number]', with: '987654'

    perform_enqueued_jobs do
      click_on 'Place Order'
    end

    orders = Order.all
    expect(orders.size).to equal(1)

    order = orders.first

    expect(order.name).to eq('Dave Thomas')
    expect(order.address).to eq('123 Main Street')
    expect(order.email).to eq('dave@example.com')
    expect(order.pay_type).to eq('Check')
    expect(order.line_items.size).to eq(1)
  end
end
