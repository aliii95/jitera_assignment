module Api
  module V1
    class ReviewsController < ActionController::API
      def search
        render json: Review.search(params[:q],
                                   fields: [{ email: :exact }, :title, :description]
                                  ).results
      end
    end
  end
end