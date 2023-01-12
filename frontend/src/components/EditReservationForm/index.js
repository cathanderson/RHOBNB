import "./EditReservationForm.css";
import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
// import { Modal } from "../../context/Modal";
import * as reservationActions from "../../store/reservations";

function EditReservationForm({ reservation, visible }) {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);

  let guest_id = null;
  if (sessionUser) {
    guest_id = sessionUser.id;
  }

  const { id } = useParams();
  const [check_in_date, setCheckInDate] = useState(reservation.checkInDate);
  const [check_out_date, setCheckOutDate] = useState(
    reservation.checkOutDate
  );
  const [num_guests, setNumGuests] = useState(reservation.numGuests);
  const [errors, setErrors] = useState([]);
  const property_id = reservation.property_id;

  const handleSubmit = (e) => {
    e.preventDefault();
    visible(false);
    if (sessionUser) {
      setErrors([]);
      return dispatch(
        reservationActions.updateReservation({
          id,
          guest_id,
          property_id,
          check_in_date,
          check_out_date,
          num_guests,
        })
      ).catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
    }
    return setErrors(["Something went wrong :/"]);
  };

  return (
    <>
      {/* <h3 className="new-reservation-form-title">Reserve this home</h3> */}
      <form onSubmit={handleSubmit} className="edit-reservation-form">
        <input type="hidden" value={property_id} />

        <input type="hidden" value={guest_id} />

        <div
          className="edit-date-input-container"
          id="top-edit-date-input-container"
        >
          <label className="edit-date-input-label">CHECK-IN</label>
          <input
            className="edit-date-input"
            type="date"
            value={check_in_date}
            onChange={(e) => setCheckInDate(e.target.value)}
            min={new Date().toISOString().split("T")[0]}
            max={check_out_date}
            required
          />
        </div>

        <div className="edit-date-input-container">
          <label className="edit-date-input-label">CHECKOUT</label>
          <input
            className="edit-date-input"
            type="date"
            value={check_out_date}
            onChange={(e) => setCheckOutDate(e.target.value)}
            min={check_in_date}
            required
          />
        </div>

        <div className="edit-num-guests-input-container">
          <label className="edit-num-guests-input-label">GUESTS</label>
          <input
            className="edit-num-guests-input"
            type="number"
            value={num_guests}
            onChange={(e) => setNumGuests(e.target.value)}
            placeholder="Number of guests"
            min="1"
            required
          />
        </div>

        <ul className="edit-reservation-form-errors">
          {errors.map((error) => (
            <li key={error}>{error}</li>
          ))}
        </ul>

        <button type="submit" className="edit-reservation-reservation-button">
          Save Edits
        </button>
      </form>
    </>
  );
}

export default EditReservationForm;
