class ProductsController < ApplicationController
def index
  @products = Product.order('name').all
end
end
