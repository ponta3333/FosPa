class DemandUserNotificationsController < ApplicationController
  def index
    @notifications = current_demand_user.demand_user_notifications.page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
