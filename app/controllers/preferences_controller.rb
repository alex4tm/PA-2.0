class PreferencesController < ApplicationController
before_action :set_preference, only: [:update, :destroy, :edit]

  def new
    @category = Category.find(params[:category_id])
    @preference = Preference.new
    authorize @preference
  end

  def create
    @preference = Preference.new(preference_params)
    @category = Category.find(params[:category_id])
    @preference.category = @category
    authorize @preference
    if @preference.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def update
    @preference.update(preference_params)

    redirect_to categories_path
  end

  def destroy
    @preference.destroy
    redirect_to categories_path
  end

  private

  def set_preference
    @preference = Preference.find(params[:id])
  end

  def preference_params
    params.require(:preference).permit(:name, :description)
  end
end