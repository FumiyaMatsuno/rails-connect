class Tag < ApplicationRecord

  has_many :term_tag_relations
  has_many :terms, through: :term_tag_relations

end
