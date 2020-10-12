class Term < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 }

  def self.genre(genre)
    if 1 < genre.to_i && genre.to_i < 13
      Term.where('genre_id LIKE(?)', "%#{genre}%")
    else
      Term.all
    end
  end

  def self.research(research)
    if research != ""
      term = Term.where('title LIKE(?)', "%#{research}%")
      if term.present?
        Term.where('title LIKE(?)', "%#{research}%")
      else
        Term.where('reference LIKE(?)', "%#{research}%")
      end
    else
      Term.all
    end
  end

end
