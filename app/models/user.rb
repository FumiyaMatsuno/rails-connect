class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :terms, foreign_key: :user_id, dependent: :destroy

  def self.guest
    find_or_create_by!(nickname: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = 'ccc111'
    end
  end

end
