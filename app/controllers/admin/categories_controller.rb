class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with name:ENV['BASIC_AUTH_USERNAME'], password:ENV['BASIC_AUTH_PASSWORD']
  
  def index
    @categories_products = pair_category_products
    @total_products = Product.count
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  def pair_category_products
    category_count = Product.group("category_id").count
    categories = Category.all
    category_info = []    
    categories.each {|elem| category_info << {"id": elem.id, "name": elem.name, "number_of_products": category_count[elem.id] || 0}}
    category_info
  end

end


