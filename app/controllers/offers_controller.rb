class OffersController < ApplicationController
  
  def new
    @offer = Offer.new
  end
  
  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    
    if @offer.save # => Validation
      flash[:success] = "オファー大成功"
      redirect_to root_url
    else
      # Failure
      render 'new'
    end
  end
  
  def offer_params
      params.require(:offer).permit(:use, :price, :house_id)
  end


end
