class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id
end
