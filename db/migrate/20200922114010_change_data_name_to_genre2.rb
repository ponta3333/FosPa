class ChangeDataNameToGenre2 < ActiveRecord::Migration[5.2]
  def change
  	change_column :genres, :name, :string
  end
end
