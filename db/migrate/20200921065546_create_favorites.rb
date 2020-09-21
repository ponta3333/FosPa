class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :demand_user_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
