class Service < ApplicationRecord

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :title, presence:true
  validates :description,presence:true
  validates :price ,presence:true

end
