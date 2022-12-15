import React from "react";
import ReviewsListItem from "./ReviewsListItem";
import "./Reviews.css"

function ReviewsList({ reviews }) {

  // calculateAvgRating = (numReviews, ) => {

  // }

  // let avgRating = 

  if (reviews.length === 0) {
    return (
      <div className="outtermost-reviews-list-container">
        <div className="reviews-list-title-container">
          <h2 className="reviews-list-title">No reviews (yet)</h2>
        </div>
      </div>
    );
  } else {
    return (
      <div className="outtermost-reviews-list-container">
        <div className="reviews-list-title-container">
          <h2 className="reviews-list-title">{reviews.length} reviews</h2>
        </div>
        <div className="outter-reviews-list-items-container">
          <div className="inner-reviews-list-items-container">
            {reviews.map((review) => (
              <ReviewsListItem key={review.id} review={review} />
            ))}
          </div>
        </div>
      </div>
    );
  }
}

export default ReviewsList;
