import csrfFetch from "./csrf";

const SET_RESERVATIONS = "reservations/setReservations";
const ADD_RESERVATION = "reservations/addReservation";
const REMOVE_RESERVATION = "reservations/removeReservation";

export const setReservations = (reservations) => ({
  type: SET_RESERVATIONS,
  payload: reservations,
});

export const addReservation = (reservation) => ({
  type: ADD_RESERVATION,
  payload: reservation,
});

export const removeReservation = (reservationId) => ({
  type: REMOVE_RESERVATION,
  payload: reservationId,
});

export const getReservations = (state) =>
  state.reservations ? Object.values(state.reservations) : [];

export const fetchReservations = () => async (dispatch) => {
  const response = await csrfFetch(`/api/reservations`);
  const data = await response.json();
  //   console.log(data);
  dispatch(setReservations(data.reservations));
  return response;
};

export const fetchReservation = (reservationId) => async (dispatch) => {
  const response = await csrfFetch(`/api/reservations/${reservationId}`);
  const data = await response.json();
  dispatch(addReservation(data.reservation));
  return response;
};

export const createReservation = (reservation) => async (dispatch) => {
//   const { guestId, propertyId, checkInDate, checkOutDate, numGuests } =
//     reservation;
  const { guest_id, property_id, check_in_date, check_out_date, num_guests } =
    reservation;
  const response = await csrfFetch(`/api/reservations`, {
    method: "POST",
    // body: JSON.stringify({
    //   guestId,
    //   propertyId,
    //   checkInDate,
    //   checkOutDate,
    //   numGuests,
    // }),
    body: JSON.stringify({
      guest_id,
      property_id,
      check_in_date,
      check_out_date,
      num_guests,
    }),
  });
  const data = await response.json();
  dispatch(addReservation(data));
};

export const updateReservation = (reservation) => async (dispatch) => {
    // debugger
    const { guest_id, property_id, check_in_date, check_out_date, num_guests } =
      reservation;
  const response = await csrfFetch(`/api/reservations/${reservation.id}`, {
    method: "PATCH",
    body: JSON.stringify({
      guest_id,
      property_id,
      check_in_date,
      check_out_date,
      num_guests,
    }),
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  dispatch(addReservation(data));
};

export const deleteReservation = (reservationId) => async (dispatch) => {
  await csrfFetch(`/api/reservations/${reservationId}`, {
    method: "DELETE",
  });

  dispatch(removeReservation(reservationId));
};

function reservationsReducer(state = {}, action) {
  const newState = { ...state };

  switch (action.type) {
    case SET_RESERVATIONS:
      return { ...newState, ...action.payload };
    case ADD_RESERVATION:
        // debugger
        if (action.payload !== undefined) {
          newState[action.payload.id] = action.payload;
        } 
      return newState;
    case REMOVE_RESERVATION:
      delete newState[action.payload];
      return newState;
    default:
      return state;
  }
}

export default reservationsReducer;
