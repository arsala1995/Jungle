class Admin::DashboardController < ApplicationController
  before_filter :http_basic_authenticate
  def show
    @number_of_product = Product.all.count
    @number_of_categories = Category.all.count
  end
end
