class Pet < ApplicationRecord

  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :gender, presence: true

end
