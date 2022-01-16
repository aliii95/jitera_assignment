# TODO: Move it to api/v1
class ReviewSerializer < BaseSerializer
  attributes :id, :created_at, :updated_at, :title, :description, :rate, :user_id
end
