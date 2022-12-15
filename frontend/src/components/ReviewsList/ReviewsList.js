import React from "react";
import ReviewsListItem from "./ReviewsListItem";
import star from "../../assets/images/star.png"
import "./Reviews.css"

function ReviewsList({ reviews }) {

  let calculateAvgRating = (numReviews, ratingsArr) => {
    let totalRatingSum = 0;
    ratingsArr.forEach((rating)=> {totalRatingSum += rating})
    return ((totalRatingSum / numReviews).toFixed(2))
  }

  let currRatingsArr = []

  reviews.forEach((review) => {
    currRatingsArr.push(review.rating)
  });

  let avgRating = calculateAvgRating(reviews.length, currRatingsArr);

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
          <h2 className="reviews-list-title">
            <span className="left-reviews-list-title">
              <img src={star} className="reviews-list-title-star" />
              {avgRating}
            </span>{" "}
            ·{" "}
            <span className="right-reviews-list-title">
              {reviews.length} reviews
            </span>
          </h2>
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
