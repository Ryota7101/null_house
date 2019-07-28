class RemoveSellOrLendFromHouses < ActiveRecord::Migration[5.1]
  def change
    remove_column :houses, :sell_or_lend, :stirng
  end
end
