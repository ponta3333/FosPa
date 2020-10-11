class GenresController < ApplicationController

	def show
		@genre = Genre.find(params[:id])
		@bleeds = Bleed.where(genre_id: params[:id])
		if params[:sex].present?
			@animals = Animal
				.where(bleed_id: @bleeds)
				.where(sex: params[:sex])
				.order(created_at: :desc)
				.page(params[:page])
		else
			@animals = Animal.where(bleed_id: @bleeds).order(created_at: :desc).page(params[:page])
		end
	end

end
