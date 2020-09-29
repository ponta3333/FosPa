class AddColumnEventsPrefecture < ActiveRecord::Migration[5.2]
  def change
  	add_column :events, :prefecture, :integer
  end
end
