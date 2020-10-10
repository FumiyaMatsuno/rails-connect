class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :terms, foreign_key: :user_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :terms, through: :likes
  
  def self.guest
    find_or_create_by!(nickname: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = 'ccc111'
    end
  end

  def liked_by?(term_id)
    likes.where(term_id: term_id).exists?
  end

end
