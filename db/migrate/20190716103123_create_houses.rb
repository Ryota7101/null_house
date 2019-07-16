class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :overview
      t.string :layout
      t.integer :price
      t.integer :land_area
      t.integer :building_area
      t.integer :age_of_a_building
      t.text :adoress
      t.string :sell_or_lend

      t.timestamps
    end
    add_index :houses, [:user_id, :created_at]
  end
end
