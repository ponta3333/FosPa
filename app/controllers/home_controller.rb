class HomeController < ApplicationController
  def top
  	@animals = Animal.all.order(created_at: :desc)
  	@events = Event.all.order(created_at: :desc)
  end

  def about
  end
end
