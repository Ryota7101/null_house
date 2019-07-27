class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.text :use
      t.integer :price
      t.integer :house_id
      t.references :user, foreign_key: true
      

      t.timestamps
    end
  end
end
