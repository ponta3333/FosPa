class DemandUsersController < ApplicationController

  before_action :authenticate_demand_user!

  def show
  end

  def edit
  	@demand_user = DemandUser.find(current_demand_user.id)
  end

  def update
  	@demand_user = DemandUser.find(current_demand_user.id)
  	if @demand_user.update(demand_user_params)
      	flash[:notice] = "会員情報を更新しました"
  		redirect_to demand_user_path(current_demand_user)
  	else
  		render :edit
  	end
  end

  private

  def demand_user_params
  	params.require(:demand_user).permit(:name, :name_kana, :nickname, :email, :postal_code, :address, :phone, :age, :job)
  end

end
