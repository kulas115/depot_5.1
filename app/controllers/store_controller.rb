class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to root_path(locale: params[:set_locale])
    else
      @products = Product.order(:title).decorate
    end
  end
end
