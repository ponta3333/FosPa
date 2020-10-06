class ChangeImageColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :supply_users, :image_id, false, ""
  	change_column :supply_users, :image_id, :string, default: ""
  	change_column_null :animals, :image_id, false, ""
  	change_column :animals, :image_id, :string, default: ""
  	change_column_null :events, :image_id, false, ""
  	change_column :events, :image_id, :string, default: ""
  	change_column_null :events, :prefecture, false, 0
  	change_column :events, :prefecture, :integer, default: 0
  end
end
