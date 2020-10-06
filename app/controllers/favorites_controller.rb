class FavoritesController < ApplicationController

  before_action :authenticate_demand_user!

def index
	@favorites = Favorite.where(demand_user_id: current_demand_user.id)
end

def create
  @animal = Animal.find(params[:animal_id])
  favorite = current_demand_user.favorites.new(animal_id: @animal.id)
  favorite.save
end

def destroy
  @animal = Animal.find(params[:animal_id])
  favorite = current_demand_user.favorites.find_by(animal_id: @animal.id)
  favorite.destroy
end

end
