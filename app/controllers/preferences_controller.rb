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
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    authorize @preference
  end

  def update
    @preference.update(preference_params)
    authorize @preference

    redirect_to dashboard_path
  end

  def destroy
    @preference.destroy
    authorize @preference
    redirect_to dashboard_path
  end

  private

  def set_preference
    @preference = Preference.find(params[:id])
  end

  def preference_params
    params.require(:preference).permit(:name, :description)
  end
end
