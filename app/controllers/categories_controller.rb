class CategoriesController < ApplicationController

  before_action :set_category, only: [:destroy, :edit, :update]

  def index
    @categories = policy_scope(Category).order(created_at: :desc)
    @category = Category.new
    @preferences = Preference.all
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    authorize @category
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
def dashboard
end
  def edit
    authorize @category
  end

  def update
    @category.update(category_params)
    authorize @category

    redirect_to categories_path(@category)
  end

  def destroy
    @category.destroy
    authorize @category
    redirect_to categories_path
  end

private

  def set_category
    @category = Category.find(params[:id])
  end


  def category_params
    params.require(:category).permit(:name)
  end
end
