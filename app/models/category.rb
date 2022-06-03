class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
end
