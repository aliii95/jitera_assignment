class Review < ApplicationRecord
  searchkick

  belongs_to :user
  belongs_to :book

  validates :title, :description, :rate, presence: true
  validates :user_id, uniqueness: { scope: :book_id }
  validates_numericality_of :rate, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5

  scope :for, ->(user) { where(user: user.followees) }
  scope :search_import, -> { includes(:user) } # For Searchkick: Searchkick uses find_in_batches to import documents. To eager load associations

  private

  # For Searchkick: The data we want to index
  def search_data
    {
      title: title,
      description: description,
      email: user.email
    }
  end
end


# Notes: 
# WITHOUT SearchKick, Search Reviews something Like this:
#   scope :search, ->(query){
#     joins(:users)
#       .where('users.email like ? OR title like ? OR description like ?',
#              User.where(email: query).select(:id),
#              "%#{query}%",
#              "%#{query}%")
#   }