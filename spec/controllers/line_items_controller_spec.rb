require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      before do
        @product = FactoryBot.create(:product)
      end
      it "creates a new LineItem" do
        expect {
          post :create, params: {product_id: @product.id}
        }.to change(LineItem, :count).by(1)
      end
    end
  end
end
