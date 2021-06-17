class AddIndexToCollections < ActiveRecord::Migration[5.2]
  def change
    add_index :collections, :user_id
  end
end
