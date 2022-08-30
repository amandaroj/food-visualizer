class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_restaurants, dependent: :destroy
  has_many :restaurants, through: :user_restaurants # a user has many restauratns through the connection table user_restaurants
end
