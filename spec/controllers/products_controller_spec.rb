require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "#delete" do
    context "while in the cart" do
      before do
        @line_item = FactoryBot.create(:line_item)
      end
      it "cannot destroy product" do
        expect {
          delete :destroy, params: { id: @line_item.product_id }
        }.to_not change(Product, :count)
      end
    end
    context "while outside of cart" do
      before do
        @product = FactoryBot.create(:product)
      end
      it "can destroy product" do
        expect {
          delete :destroy, params: { id: @product.id }
        }.to change(Product, :count).by(-1)
      end
    end
  end
end
