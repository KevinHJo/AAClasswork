class AddColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :author_id, :integer
    add_index :likes, :author_id
  end
end
