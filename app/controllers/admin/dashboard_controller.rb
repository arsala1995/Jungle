class Admin::DashboardController < ApplicationController
  def show
    @number_of_product = Product.all.count
    @number_of_categories = Category.all.count
  end
end
