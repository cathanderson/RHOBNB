class Api::ReviewsController < ApplicationController
    wrap_parameters include: Review.attribute_names

    def index
        if params[:property_id] == nil
            @reviews = Review.all
        else
            @reviews = Review.where(property_id: params[:property_id])
            # debugger
        end
        render :index
    end

    def show
        @review = Review.find(params[:id])
        render :show
    end

    def create
        @review = Review.new(review_params)

        if @review.save
            render :show
        else 
            render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private

    def review_params
        params.require(:review).permit(:guest_id, :property_id, :rating, :review)
    end
    
end