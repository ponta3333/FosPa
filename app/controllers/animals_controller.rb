class AnimalsController < ApplicationController
  def show
  end

  def index
  end

  def new
  	@animal = Animal.new
  	@bleeds = Bleed.all
  end

  def create
  end

  def edit
  end

  def update
  end

end
