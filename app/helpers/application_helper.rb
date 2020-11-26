module ApplicationHelper
  def unchecked_notifications
    if current_demand_user
      @notifications = current_demand_user.demand_user_notifications.where(checked: false)
    elsif current_supply_user
      @notifications = current_supply_user.supply_user_notifications.where(checked: false)
    end
  end
end
