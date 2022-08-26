class Post < ApplicationRecord

  belongs_to :user
  belongs_to :pet
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many_attached :pictures, dependent: :destroy

end