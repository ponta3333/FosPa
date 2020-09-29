class EventsController < ApplicationController

  def show
  	@event = Event.find(params[:id])
  end

  def index
  	if demand_user_signed_in?
  		@events = Event.order(day: :desc).page(params[:page]).reverse_order
  	elsif supply_user_signed_in?
  		@events = current_supply_user.events.order(day: :desc).page(params[:page]).reverse_order
  	end
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	@event.supply_user_id = current_supply_user.id
  	if @event.save
  		flash[:notice] = "イベントを作成しました"
  		redirect_to event_path(@event)
  	else
  		render :new
  	end
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update(event_params)
  		flash[:notice] = "イベント内容を編集しました"
  		redirect_to event_path(@event)
  	else
  		render :edit
  	end
	end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	flash[:notice] = "イベントを削除しました"
  	redirect_to events_path
  end

  private

  def event_params
  	params.require(:event).permit(:name, :day,:prefecture, :place, :content, :image)
  end

end
