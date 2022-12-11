import "./NewReservationForm.css";
import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
// import { Modal } from "../../context/Modal";
import * as reservationActions from "../../store/reservations";

function NewReservationForm() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);

  let guest_id = null;
  if (sessionUser) {
    guest_id = sessionUser.id;
  }

  const { id } = useParams();
  const [check_in_date, setCheckInDate] = useState("");
  const [check_out_date, setCheckOutDate] = useState("");
  const [num_guests, setNumGuests] = useState("");
  const [errors, setErrors] = useState([]);
  const property_id = id;

  //   if (!sessionUser) return <Redirect to="/" />;

//   debugger;

  const handleSubmit = (e) => {
    e.preventDefault();
    if (sessionUser) {
      setErrors([]);
      return dispatch(
        reservationActions.createReservation({
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
    return setErrors(["Please log in to reserve this property!"]);
  };

  return (
    <>
      {/* <h3 className="new-reservation-form-title">Reserve this home</h3> */}
      <form onSubmit={handleSubmit} className="reservation-form">
        <input type="hidden" value={property_id} />

        <input type="hidden" value={guest_id} />

        <input
          type="date"
          value={check_in_date}
          onChange={(e) => setCheckInDate(e.target.value)}
          placeholder="3/1/23"
          required
        />

        <input
          type="date"
          value={check_out_date}
          onChange={(e) => setCheckOutDate(e.target.value)}
          placeholder="4/1/23"
          required
        />

        <input
          type="number"
          value={num_guests}
          onChange={(e) => setNumGuests(e.target.value)}
          required
        />

        <ul className="form-errors">
          {errors.map((error) => (
            <li key={error}>{error}</li>
          ))}
        </ul>

        <button type="submit">Reserve</button>
      </form>
    </>
  );
}

export default NewReservationForm;
