import "./NewReservationForm.css";
import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams, useHistory } from "react-router-dom";
// import { Modal } from "../../context/Modal";
import * as reservationActions from "../../store/reservations";
import moment from 'moment'

function NewReservationForm() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const history = useHistory();

  let guest_id = null;
  if (sessionUser) {
    guest_id = sessionUser.id;
  }

  const { id } = useParams();
  const [check_in_date, setCheckInDate] = useState(
    moment().format("YYYY-MM-DD")
  );
  const [check_out_date, setCheckOutDate] = useState(
    moment()
    .add(7,'days')
    .format("YYYY-MM-DD")
  );
  const [num_guests, setNumGuests] = useState("");
  const [errors, setErrors] = useState([]);
  const property_id = id;

  const handleSubmit = (e) => {
    e.preventDefault();
    if (sessionUser) {
      setErrors([]);
      history.push(`/reservations`);
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
              min={new Date().toISOString().split("T")[0]}
              max={check_out_date}
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
              min={check_in_date}
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
            min="1"
            required
          />
        </div>

        <ul className="reservation-form-errors">
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
