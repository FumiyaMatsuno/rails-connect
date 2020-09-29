class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string     :title        , null: false
      t.string     :reference    , null: false
      t.text       :text         , null: false
      t.integer    :genre_id     , null: false
      t.references  :user        , null: false ,foreign_key: true
      t.timestamps
    end
  end
end
