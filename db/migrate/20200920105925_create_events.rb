class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :supply_user_id
      t.string :name
      t.string :day
      t.string :place
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
