class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name:ENV['BASIC_AUTH_USERNAME'], password:ENV['BASIC_AUTH_PASSWORD']

  def show
    @total_count = Product.count
    @categories_products = pair_category_products 
  end
  
  private
  def pair_category_products
    category_count = Product.group("category_id").count
    category_info = []
    category_count.each {|key, value| category_info << {"id": key, "name": Category.find(key).name, "number_of_products": value}}
    category_info
  end


end
