import React from "react";

function ReviewsListItem({ review }) {
  console.log(review)

  return (
    <div className={"reviews-list-item"}>
      <div className="reviews-list-item-container">
        This will be a review list item!
      </div>
    </div>
  );
}

export default ReviewsListItem;
