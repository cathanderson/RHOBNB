import React from "react";
import star from "../../assets/images/star.png";

function ReviewsListItem({ review }) {
  // console.log(review);

  return (
    <div className="outtermost-reviews-list-item-container">
      <div className="top-reviews-list-item-container">
        <div className="top-left-reviews-list-item-container">
          <div className="reviews-list-item-image-container">
            <img className="reviews-list-item-image" src={review.photoUrl} />
          </div>
          <div className="reviews-list-item-name-date-container">
            <div className="reviews-list-item-name">{review.reviewerName}</div>
            <div className="reviews-list-item-date">{review.reviewDate}</div>
          </div>
        </div>
        <div className="top-right-reviews-list-item-container">
          <div className="reviews-list-item-rating-container">
            <div className="reviews-list-item-rating">{review.rating}</div>
            <img className="reviews-list-item-star-icon" src={star} />
          </div>
        </div>
      </div>
      <div className="bottom-reviews-list-item-container">
        <div className="reviews-list-item-review">{review.review}</div>
      </div>
    </div>
  );
}

export default ReviewsListItem;
