require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  describe "GET /line_items" do
    it "works! (now write some real specs)" do
      get line_items_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /line_items" do
    it "creates new LineItem" do
      product = FactoryBot.create(:product)
      # byebug

      expect{
        post "/line_items", params: { product_id: product.id }
      }.to change(LineItem, :count).by(1)
    end
  end

  describe "PATCH /line_item" do
    it "updates line_item" do
      line_item = FactoryBot.create(:line_item)
      product = FactoryBot.create(:product, title: "New Product")

      patch "/line_items/#{line_item.id}", params: { line_item: { product_id: product.id } }
      expect(response).to redirect_to line_item_path(line_item)
    end
  end
end
