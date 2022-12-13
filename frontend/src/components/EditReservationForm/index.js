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
  const [check_in_date, setCheckInDate] = useState(reservation.check_in_date);
  const [check_out_date, setCheckOutDate] = useState(reservation.check_out_date);
  const [num_guests, setNumGuests] = useState(reservation.num_guests);
  const [errors, setErrors] = useState([]);
  const property_id = reservation.property_id;

  //   if (!sessionUser) return <Redirect to="/" />;

  //   debugger;

  const handleSubmit = (e) => {
    e.preventDefault();
    visible(false)
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

        <input
          type="date"
          value={check_in_date}
          onChange={(e) => setCheckInDate(e.target.value)}
          min={new Date().toISOString().split("T")[0]}
          max={check_out_date}
          required
        />

        <input
          type="date"
          value={check_out_date}
          onChange={(e) => setCheckOutDate(e.target.value)}
          min={check_in_date}
          required
        />

        <input
          type="number"
          value={num_guests}
          onChange={(e) => setNumGuests(e.target.value)}
          min="1"
          required
        />

        <ul className="form-errors">
          {errors.map((error) => (
            <li key={error}>{error}</li>
          ))}
        </ul>

        <button type="submit">Save Edits</button>
      </form>
    </>
  );
}

export default EditReservationForm;
