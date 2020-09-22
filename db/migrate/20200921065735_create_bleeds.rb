class CreateBleeds < ActiveRecord::Migration[5.2]
  def change
    create_table :bleeds do |t|
      t.integer :genre_id, null:false
      t.string :name, null:false

      t.timestamps
    end
  end
end
