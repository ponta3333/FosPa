class ChangeDataDayToEvent < ActiveRecord::Migration[5.2]
  def change
  	change_column :events, :day, :date
  end
end
