class TermTagRelation < ApplicationRecord

  belongs_to :term
  belongs_to :tag

end
