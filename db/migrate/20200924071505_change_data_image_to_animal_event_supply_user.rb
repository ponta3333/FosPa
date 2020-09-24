class ChangeDataImageToAnimalEventSupplyUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :animals, :image, :image_id
  	rename_column :events, :image, :image_id
  	rename_column :supply_users, :image, :image_id
  end
end
