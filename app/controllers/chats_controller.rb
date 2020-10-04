class ChatsController < ApplicationController

  def create
  	@chat = Chat.new(chat_params)
  	if current_demand_user
	@chats = Chat.where(supply_user_id: @chat.supply_user_id, demand_user_id: current_demand_user.id)
	elsif
	@chats = Chat.where(supply_user_id: current_supply_user.id, demand_user_id: @chat.demand_user_id )
	end
  	if current_demand_user
  		@chat.demand_user_id = current_demand_user.id
  		@chat.which_from = current_demand_user.nickname
  	elsif current_supply_user
  		@chat.supply_user_id = current_supply_user.id
  		@chat.which_from = current_supply_user.name
  	end
  	if @chat.save
  		flash[:notice] = "メッセージを投稿しました"
  		redirect_to request.referer
  	else
  		render :new
  	end
  end

  def index
  end

  private

  def chat_params
  	params.require(:chat).permit(:demand_user_id, :supply_user_id, :message, :which_from)
  end

end
