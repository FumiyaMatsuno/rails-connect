class RemoveUserIdIdOnLikes < ActiveRecord::Migration[6.0]
  def up
    remove_column :likes, :user_id_id
  end
  def down
    add_column :likes, :user_id_id
  end
end
