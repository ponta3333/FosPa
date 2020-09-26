class SupplyUsersController < ApplicationController
  def show
  end

  def edit
  	@supply_user = SupplyUser.find(current_supply_user.id)
  end

  def update
  	@supply_user = SupplyUser.find(current_supply_user.id)
  	if @supply_user.update(supply_user_params)
      	flash[:notice] = "会員情報を更新しました"
  		redirect_to supply_user_path(current_supply_user)
  	else
  		render :edit
  	end
  end

  private

  def supply_user_params
  	params.require(:supply_user).permit(:image, :name, :name_kana, :email, :postal_code, :address, :phone)
  end

end
