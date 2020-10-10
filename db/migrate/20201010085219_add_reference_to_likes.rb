class AddReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :user_id
    remove_column :likes, :term_id
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :term, foreign_key: true
  end
end
