class ProductsController < ApplicationController
   skip_before_action :authenticate_user!, only: :index, raise: false

  def index
    @products = Product.all
  end
end
