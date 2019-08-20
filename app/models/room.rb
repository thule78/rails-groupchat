class Room < ApplicationRecord
  has_many :users, through: :roomusers
  has_many :chats
  has_many :roomusers

  validates :name, presence: true, length: {maximum: 50}
end
