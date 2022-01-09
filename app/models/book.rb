class Book < ApplicationRecord
  # TODO: Should it be associated with an author? Can user model be referenced as author here? if yes, add reference of user!

  validates :isbn, :title, :description, :rate, presence: true
  validates :isbn, uniqueness: true
end
