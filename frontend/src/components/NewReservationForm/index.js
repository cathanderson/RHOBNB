import "./NewReservationForm.css";
import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
// import { Modal } from "../../context/Modal";
import * as reservationActions from "../../store/reservations";

function NewReservationForm() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const guest_id = sessionUser.id;
  const { property_id } = useParams();
  const [check_in_date, setCheckInDate] = useState("");
  const [check_out_date, setCheckOutDate] = useState("");
  const [num_guests, setNumGuests] = useState("");
  const [errors, setErrors] = useState([]);

  //   if (!sessionUser) return <Redirect to="/" />;

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
    return setErrors(["Something else went wrong, please try again."]);
  };

  return (
    <>
      {/* <h3 className="new-reservation-form-title">Reserve this home</h3> */}
      <form onSubmit={handleSubmit} className="reservation-form">
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

        {/* <input
          type="text"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Email"
          required
        /> */}

        <ul className="form-errors">
          {errors.map((error) => (
            <li key={error}>{error}</li>
          ))}
        </ul>

        <button type="submit">Create Reservation</button>
      </form>
    </>
  );
}

export default NewReservationForm;
