require 'rails_helper'

RSpec.feature "LineItems", type: :feature do
  scenario "product gets correctly added to cart" do
    product = FactoryBot.create(:product)
    visit root_path
    expect {
      click_button 'Add to Cart'
    }.to change(LineItem, :count).by(1)

    aggregate_failures do
      expect(page).to have_css("h2", text: "Your Pragmatic Cart")
      expect(page).to have_css("li", text: "Programming Ruby 1.9")
    end
  end
end
