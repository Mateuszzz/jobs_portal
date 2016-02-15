class CategoriesController < ApplicationController
  before_action :authorize
  before_action :admin_role?
  
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    
    if @category.save
        flash[:success] = "Category successfully created!"
        redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end
  
  private
  
  def category_params
      params.require(:category).permit(:name)
  end
end
