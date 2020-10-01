class ApplicationController < ActionController::Base

	before_action :menu_genres

	private

	def menu_genres
		@genres = Genre.all
	end

end