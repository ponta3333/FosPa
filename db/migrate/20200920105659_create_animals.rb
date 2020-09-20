class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.integer :bleed_id
      t.integer :supply_user_id
      t.string :name
      t.integer :sex
      t.integer :age
      t.string :image
      t.text :content
      t.boolean :animal_status

      t.timestamps
    end
  end
end
