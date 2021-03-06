class User < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def author?(object)
    id == object.user_id
  end
end
