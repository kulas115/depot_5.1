require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:product) { FactoryBot.create(:product) }

  describe "GET /orders" do
    it "works! (now write some real specs)" do
      get orders_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /orders/new" do
    it "requires item in cart" do
      get new_order_path
      expect(response).to redirect_to root_path
      # byebug
      expect(response.request.flash[:notice]).to match("Your cart is empty")
    end
    it "with item in the cart lets order through" do
      post line_items_url, params: { product_id: product.id }

      get new_order_path
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /orders" do
    it "should create order" do
      order = FactoryBot.create(:order)
      # byebug
      expect{
        post orders_path, params: { order: { address: order.address, email: order.email, name: order.name, pay_type: order.pay_type } }
      }.to change(Order, :count).by(1)

      expect(response).to redirect_to root_path(locale: 'en')
    end
  end
end
