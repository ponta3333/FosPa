class CreateBleeds < ActiveRecord::Migration[5.2]
  def change
    create_table :bleeds do |t|
      t.integer :genre_id
      t.string :name

      t.timestamps
    end
  end
end
