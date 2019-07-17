class HousesController < ApplicationController
  def index
    @houses = House.all
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
    @house = current_user.houses.create(house_params)
    ##@house = House.new(house_params)
    if @house.save # => Validation
      flash[:success] = "登録成功だっちゃ"
      redirect_to root_url
    else
      # Failure
      render 'new'
    end
  end
  
  private

    def house_params
      params.require(:house).permit(:title, :overview,:layout,:price,:land_area,
      :building_area,:age_of_a_building,:adoress,:sell_or_lend)
    end

end
