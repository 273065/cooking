class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_recipes, through: :likes, source: :recipe

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  def already_liked?(recipe)
    self.likes.exists?(recipe_id: recipe.id)
  end
end
