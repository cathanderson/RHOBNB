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

        <div className="combined-date-input-container" id="left-date-input">
          <div className="date-input-container">
            <label className="date-input-label">CHECK-IN</label>
            <input
              className="date-input"
              type="date"
              value={check_in_date}
              onChange={(e) => setCheckInDate(e.target.value)}
              required
            />
          </div>

          <div className="date-input-container" id="right-date-input">
            <label className="date-input-label">CHECKOUT</label>
            <input
              className="date-input"
              type="date"
              value={check_out_date}
              onChange={(e) => setCheckOutDate(e.target.value)}
              required
            />
          </div>
        </div>

        <div className="num-guests-input-container">
          <label className="num-guests-input-label">GUESTS</label>
          <input
            className="num-guests-input"
            type="number"
            value={num_guests}
            onChange={(e) => setNumGuests(e.target.value)}
            placeholder="Number of guests"
            required
          />
        </div>

        <ul className="form-errors">
          {errors.map((error) => (
            <li key={error}>{error}</li>
          ))}
        </ul>

        <button className="reserve-button" type="submit">
          Reserve
        </button>
      </form>
    </>
  );
}

export default NewReservationForm;
