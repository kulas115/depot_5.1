require 'rails_helper'

RSpec.feature "Stores", type: :feature do
  scenario "homepage renders correct elements" do
    product = FactoryBot.create(:product)
    visit root_path
    # save_and_open_page
    expect(page).to have_selector("nav.side_nav a", minimum: 4)
    expect(page).to have_css("main ul.catalog li")
    expect(page).to have_content(/\$[\d]+\.\d\d/)
    expect(page).to have_selector("h2", text: "Programming Ruby 1.9")
  end
end
