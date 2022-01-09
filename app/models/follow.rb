class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  # To ensure a user can only follow another user once and a user can only have one follow from another user.
  validates :follower_id, uniqueness: { scope: :followee_id }
  # validates :followee_id, uniqueness: { scope: :follower_id } # TODO: Dont think this will be needed!
  validates :follower_id, exclusion: { in: ->(follow) { [follow.followee_id] }, message: "can not be same as followee_id" }
end