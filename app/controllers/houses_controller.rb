class HousesController < ApplicationController
  def index
  end

  def show
    @house = House.find(params[:id])
  end

  def edit
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end
  
  def destroy
    House.find(params[:id]).destroy
    flash[:success] = "空き家を削除しました"
    redirect_to houses_url
  end
  
  def update
    @house = House.find(params[:id])
    if @house.update_attributes(house_params)
      flash[:success] = "空き家のプロフィールを更新しました"
      redirect_to @house
    else
      render 'edit'
    end
  end
  
  def create
    @house = House.new(house_params)
    @house.save
    flash[:success] = '空き家を登録しました'
    redirect_to root_url
  end

end
