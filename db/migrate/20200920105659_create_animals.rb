class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.integer :bleed_id, null:false
      t.integer :supply_user_id, null:false
      t.string :name, null:false
      t.integer :sex, null:false
      t.integer :age, null:false
      t.string :image, null:false
      t.text :content, null:false
      t.boolean :animal_status, default:true ,null:false

      t.timestamps
    end
  end
end
