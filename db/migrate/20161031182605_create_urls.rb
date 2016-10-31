class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :title
      t.string :URL
      t.boolean :read, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
