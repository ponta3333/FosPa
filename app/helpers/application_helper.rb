module ApplicationHelper
  def unchecked_notifications
    @notifications = current_demand_user.demand_user_notifications.where(checked: false)
  end
end
