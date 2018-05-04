require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  # let(:product) { FactoryBot.create(:product) }
  let(:line_item) { FactoryBot.create(:line_item) }

  describe "POST #create" do
    context "with valid params" do
      before do
        @product = FactoryBot.create(:product)
      end
      it "creates a new LineItem" do
        expect {
          post :create, params: { product_id: @product.id }
        }.to change(LineItem, :count).by(1)
      end
    end
  end
  # describe "PATCH #update" do
  #   context "with valid params" do
  #     it "updates line_item" do
  #
  #       byebug
  #       # @new_product = FactoryBot.create(:product_second)
  #       # prev_updated_at = line_item.updated_at
  #       # put :update, params: { line_item { product_id: @new_product.id } }
  #       # line
  #     end
  #   end
  # end
end
