class AnimalsController < ApplicationController

  def show
  	@animal = Animal.find(params[:id])
  	@genre = Genre.find(@animal.bleed.genre_id)
  end

  def index
  	@animals = current_supply_user.animals.order(created_at: :desc).page(params[:page])
  end

  def new
  	@animal = Animal.new
  	@bleed_dog = Bleed.where(genre_id: 1)
  	@bleed_cat = Bleed.where(genre_id: 2)
  end

  def create
  	@animal = Animal.new(animal_params)
    # params[:genre_radio] が 1
    params[:animal][:dog_bleed_id]
    # @animal の bleed_id に params[:animal][:dog_bleed_id] を代入
    if params[:genre_radio].to_i == 1
      @animal.bleed_id = params[:animal][:dog_bleed_id]
    # params[:genre_radio] が 2
    elsif params[:genre_radio].to_i == 2
    # @animal の bleed_id に params[:animal][:cat_bleed_id] を代入
      @animal.bleed_id = params[:animal][:cat_bleed_id]
    end

  	@animal.supply_user_id = current_supply_user.id
  	@bleed_dog = Bleed.where(genre_id: 1)
  	@bleed_cat = Bleed.where(genre_id: 2)
  	if @animal.save
  		flash[:notice] = "募集完了しました"
  		redirect_to animals_path
  	else
  		render :new
  	end
  end

  def edit
    @animal = Animal.find(params[:id])
    @bleed_dog = Bleed.where(genre_id: 1)
    @bleed_cat = Bleed.where(genre_id: 2)
  end

  def update
    @animal = Animal.find(params[:id])
    # params[:genre_radio] が 1
    params[:animal][:dog_bleed_id]
    # @animal の bleed_id に params[:animal][:dog_bleed_id] を代入
    if params[:genre_radio].to_i == 1
      @animal.bleed_id = params[:animal][:dog_bleed_id]
    # params[:genre_radio] が 2
    elsif params[:genre_radio].to_i == 2
    # @animal の bleed_id に params[:animal][:cat_bleed_id] を代入
      @animal.bleed_id = params[:animal][:cat_bleed_id]
    end
    @animal.supply_user_id = current_supply_user.id
    @bleed_dog = Bleed.where(genre_id: 1)
    @bleed_cat = Bleed.where(genre_id: 2)
    if @animal.update(animal_params)
      flash[:notice] = "編集完了しました"
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  private

  def animal_params
  	params.require(:animal).permit(:supply_user_id, :image, :name, :sex, :age, :content, :animal_status)
  end

end
