class GenresController < ApplicationController

	def show
		@genre = Genre.find(params[:id])
		@bleeds = Bleed.where(genre_id: params[:id])
		@animals = Animal.where(bleed_id: @bleeds).order(created_at: :desc).page(params[:page])
	end

end
