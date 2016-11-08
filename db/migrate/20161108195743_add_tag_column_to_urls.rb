class AddTagColumnToUrls < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :tag, :string, default: ""
  end
end
