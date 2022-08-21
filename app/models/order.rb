class Order < ApplicationRecord

  belongs_to :user
  belongs_to :service

  validates :title, presence: true
  validates :price, presence: true
  validates :service_id, presence: true

end
