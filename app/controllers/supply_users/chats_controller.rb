class SupplyUsers::ChatsController < ApplicationController
	def new
		@chat = Chat.new
		@chats = Chat.where(demand_user_id: params[:demand_user_id], supply_user_id: current_supply_user.id)
		@demand_user = DemandUser.find(params[:demand_user_id])
		render 'chats/new'
	end
end
