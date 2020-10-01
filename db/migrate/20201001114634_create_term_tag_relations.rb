class CreateTermTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :term_tag_relations do |t|
      t.references :term, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
