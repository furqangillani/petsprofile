class Order < ApplicationRecord


  belongs_to :service
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :service_id, presence: true

end
