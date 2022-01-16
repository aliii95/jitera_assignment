class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :follower_id, uniqueness: { scope: :followee_id }
  validates :follower_id, exclusion: { in: ->(follow) { [follow.followee_id] }, message: "can not be same as followee_id" }
end