class DemandUsers::ChatsController < ApplicationController
	def new
		@chat = Chat.new
		@chats = Chat.where(supply_user_id: params[:supply_user_id], demand_user_id: current_demand_user.id)
		@supply_user = SupplyUser.find(params[:supply_user_id])
		render 'chats/new'
	end
end
