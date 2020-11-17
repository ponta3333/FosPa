class ChatsController < ApplicationController

  def create
  	@chat = Chat.new(chat_params)
  	if current_demand_user
			@chats = Chat.where(supply_user_id: @chat.supply_user_id, demand_user_id: current_demand_user.id)
  		@chat.demand_user_id = current_demand_user.id
  		@chat.which_from = current_demand_user.nickname
  	elsif current_supply_user
			@chats = Chat.where(supply_user_id: current_supply_user.id, demand_user_id: @chat.demand_user_id )
  		@chat.supply_user_id = current_supply_user.id
  		@chat.which_from = current_supply_user.name
  	end
  	if @chat.save
      if current_supply_user
        @notification = DemandUserNotification.new(
          chat_id: @chat.id,
          receiver_id: @chat.demand_user_id,
          sender_id: current_supply_user.id)
        @notification.save
      end
        binding.pry
  		flash[:notice] = "メッセージを投稿しました。"
  		redirect_to request.referer
  	else
  		render :new
  	end
  end

  def index
  	if current_demand_user
			@chats = current_demand_user.chats.select(:supply_user_id).distinct
  	elsif current_supply_user
			@chats = current_supply_user.chats.select(:demand_user_id).distinct
		end
  end

  private

  def chat_params
  	params.require(:chat).permit(:demand_user_id, :supply_user_id, :message, :which_from)
  end

end
