class ChangeUrlColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :urls, :URL, :string
    add_column :urls, :url, :string
  end
end
