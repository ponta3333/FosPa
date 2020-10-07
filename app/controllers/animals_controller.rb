class AnimalsController < ApplicationController

  before_action :authenticate_supply_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
  	@animal = Animal.find(params[:id])
  	@genre = Genre.find(@animal.bleed.genre_id)
  end

  def index
    if current_supply_user
  	  @animals = current_supply_user.animals.order(created_at: :desc).page(params[:page])
    elsif current_demand_user
      @search_params = animal_search_params
      @animals = Animal.search(@search_params).includes(:bleed).order(created_at: :desc).page(params[:page])
      @bleed_dog = Bleed.where(genre_id: 1)
      @bleed_cat = Bleed.where(genre_id: 2)
    end
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

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      flash[:notice] = "募集を削除しました"
      redirect_to animals_path
    else
      render :show
    end
  end

  private

  def animal_params
  	params.require(:animal).permit(:supply_user_id, :image, :name, :sex, :age, :content, :animal_status)
  end

  def animal_search_params
    params.fetch(:search, {}).permit(:name, :sex, :age, :dog_bleed_id, :cat_bleed_id)
  end

end
