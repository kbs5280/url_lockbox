class RemoveColumnFromUrls < ActiveRecord::Migration[5.0]
  def change
    remove_column :urls, :tag, :string
  end
end
