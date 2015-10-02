class CategoriesController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category has ben created"
      # redirect_to categories_path
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end