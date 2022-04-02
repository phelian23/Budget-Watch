class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true
end
