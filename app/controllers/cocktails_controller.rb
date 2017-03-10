class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end


  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def add_dose
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.doses.destroy_all
    @cocktail.delete
    redirect_to cocktails_path
  end

  private
  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end
