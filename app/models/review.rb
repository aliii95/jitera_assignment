class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, :description, :rate, presence: true
  validates :user_id, uniqueness: { scope: :book_id }
  validates_numericality_of :rate, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5

  scope :for, ->(user) { where(user: user.followees) }
end
