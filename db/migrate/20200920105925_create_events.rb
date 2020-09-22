class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :supply_user_id, null:false
      t.string :name, null:false
      t.string :day, null:false
      t.string :place, null:false
      t.string :image, null:false
      t.text :content, null:false

      t.timestamps
    end
  end
end
