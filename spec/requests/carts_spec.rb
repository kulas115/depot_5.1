require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /carts" do
    it "works! (now write some real specs)" do
      get carts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /cart" do
    it "destroy cart" do
      product = FactoryBot.create(:product)
      post line_items_path, params: { product_id: product.id}
      cart = Cart.find(session[:cart_id])

      expect {
        delete "/carts/#{cart.id}"
      }.to change(Cart, :count).by(-1)
    end
  end
end
