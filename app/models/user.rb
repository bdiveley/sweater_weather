require 'securerandom'

class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  validates :api_key, uniqueness: true

  def self.generate_key
    SecureRandom.hex(27)
  end

  def add_favorites(data)
    favorites.create(location: data.downcase)
  end
end
