class DemandUserNotificationsController < ApplicationController
  def index
    if current_demand_user
      @notifications = current_demand_user.demand_user_notifications.page(params[:page])
      @notifications.where(checked: false).each do |notification|
        notification.update_attributes(checked: true)
      end
    end
  end
end
