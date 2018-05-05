require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  describe "GET /line_items" do
    it "works! (now write some real specs)" do
      get line_items_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /line_items" do
    let(:product) { FactoryBot.create(:product) }

    it "creates new LineItem" do
      expect{
        post "/line_items", params: { product_id: product.id }
      }.to change(LineItem, :count).by(1)
    end

    it "creates new LineItem via AJAX" do
      product = FactoryBot.create(:product)
      expect{
        post "/line_items", params: { product_id: product.id }, xhr: true
      }.to change(LineItem, :count).by(1)

      expect(response).to have_http_status(200)
      expect(response.body).to include("<tr class=\\'line-item-highlight\\'>")
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
