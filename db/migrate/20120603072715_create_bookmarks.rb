class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :url, limit: 1000
      t.text :description

      t.timestamps
    end
  end
end
