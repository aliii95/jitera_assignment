class Book < ApplicationRecord
  # TODO: Should it be associated with an author? Can user model be referenced as author here? if yes, add reference of user!
  has_many :reviews

  validates :isbn, :title, :description, :rate, presence: true # rate is the price of the book
  validates :isbn, uniqueness: true
end