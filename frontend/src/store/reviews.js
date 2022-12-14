import csrfFetch from "./csrf";

const SET_REVIEWS = "reviews/setReviews";
const ADD_REVIEW = "reviews/addReview";
const REMOVE_REVIEW = "reviews/removeReview";

export const setReviews = (reviews) => ({
  type: SET_REVIEWS,
  payload: reviews,
});

export const addReview = (review) => ({
  type: ADD_REVIEW,
  payload: review,
});

export const removeReview = (reviewId) => ({
  type: REMOVE_REVIEW,
  payload: reviewId,
});

export const getReviews = (state) =>
  state.reviews ? Object.values(state.reviews) : [];

export const fetchReviews = () => async (dispatch) => {
  const response = await csrfFetch(`/api/reviews`);
  const data = await response.json();
  //   console.log(data);
  dispatch(setReviews(data.reviews));
  return response;
};

export const fetchReview = (reviewId) => async (dispatch) => {
  const response = await csrfFetch(`/api/reviews/${reviewId}`);
  const data = await response.json();
  dispatch(addReview(data.review));
  return response;
};

export const fetchReviewsByProperty = (propertyId) => async (dispatch) => {
  const response = await csrfFetch(
    "/api/reviews?" + new URLSearchParams({ propertyId }),
    {
      method: "GET",
      headers: {
        "content-type": "application/json",
      },
    }
  );
  const data = await response.json();
  dispatch(setReviews(data.reviews));
};

function reviewsReducer(state = {}, action) {
  const newState = { ...state };

  switch (action.type) {
    case SET_REVIEWS:
      return { ...action.payload };
    case ADD_REVIEW:
      // debugger
      if (action.payload !== undefined) {
        newState[action.payload.id] = action.payload;
      }
      return newState;
    case REMOVE_REVIEW:
      delete newState[action.payload];
      return newState;
    default:
      return state;
  }
}

export default reviewsReducer;
