class StoreController < ApplicationController
  def index
    @products = Product.order(:title).decorate
  end
end
