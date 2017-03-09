class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params["cocktail_id"])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params["cocktail_id"])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @cocktail = Cocktail.find(params["cocktail_id"])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end


end