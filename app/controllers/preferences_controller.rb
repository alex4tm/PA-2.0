class PreferencesController < ApplicationController
before_action :set_preference, only: [:create, :update, :destroy, :edit]

  def create
    @preference = Preference.new(reference_params)
    @preference.user = current_user
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
