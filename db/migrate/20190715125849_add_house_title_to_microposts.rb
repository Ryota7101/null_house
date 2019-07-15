class AddHouseTitleToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :house_title, :string
  end
end
