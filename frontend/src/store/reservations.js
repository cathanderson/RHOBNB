import csrfFetch from "./csrf";

const SET_RESERVATIONS = "reservations/setReservations";
const ADD_RESERVATION = "reservations/addReservation";
const REMOVE_RESERVATION = "reservations/removeReservation";

const setReservations = (reservations) => ({
  type: SET_RESERVATIONS,
  payload: reservations,
});

export const addReservation = (reservation) => ({
  type: ADD_RESERVATION,
  payload: reservation,
});

const removeReservation = (reservation) => ({
  type: REMOVE_RESERVATION,
  payload: reservation,
});
