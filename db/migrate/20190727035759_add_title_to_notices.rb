class AddTitleToNotices < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :title, :string
  end
end
