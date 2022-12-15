import React from "react";
import ReviewsListItem from "./ReviewsListItem";

function ReviewsList({ reviews }) {
  // console.log(reviews)
  return (
    <div className="outtermost-reviews-list-container">
      <div className="reviews-list-title-container">
        <h2 className="reviews-list-title">Reviews</h2>
      </div>
      <div className="outter-reviews-list-items-container">
        <div className="inner-reviews-list-items-container">
          {reviews.map((review) => (
            <ReviewsListItem
              key={review.id}
              review={review}
            />
          ))}
        </div>
      </div>
    </div>
  );
}

export default ReviewsList;
