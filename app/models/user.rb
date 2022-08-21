class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :orders, dependent: :destroy
  has_many :likes
  has_many :services, dependent: :destroy
  has_one :profile
  has_many :pets
  has_many :orders, dependent: :destroy
  has_many :types, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
end
