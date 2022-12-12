import React, { useEffect, useState } from "react";
import { useParams, useHistory, Redirect } from "react-router-dom";
import NewReservationForm from "../NewReservationForm";
import { useDispatch, useSelector } from "react-redux";
import { fetchReservation, deleteReservation } from "../../store/reservations";
import { Modal } from "../../context/Modal";
import "./ReservationShow.css";
import EditReservationForm from "../EditReservationForm";

function ReservationShow() {
  const dispatch = useDispatch();
  const { id } = useParams();
  const [showEditReservationModal, setShowEditReservationModal] =
    useState(false);
  const history = useHistory();

  // debugger
  useEffect(() => {
    // debugger
    dispatch(fetchReservation(id));
  }, [id, dispatch]);

  const reservation = useSelector((state) => state.reservations[id]);
  // debugger

  if (!reservation) {
    return null;
  }

  const { guestId, propertyId, checkInDate, checkOutDate, numGuests } =
    reservation;

  const handleCancelClick = () => {
    dispatch(deleteReservation(id));
    history.push(`/reservations`);
    // <Redirect to="/reservations" />
  }

  return (
    <>
      <div className="reservation-show">
        <section className="reservation-show-page-info-container">
          <ul className="reservation-show-page-fields">
            <li>Guest ID: {guestId}</li>
            <li>Property ID: {propertyId}</li>
            <li>Check-in: {checkInDate}</li>
            <li>Check-out: {checkOutDate}</li>
            <li>Number of Guests: {numGuests}</li>
            <button onClick={handleCancelClick}>
              Cancel Reservation
            </button>
            <button onClick={() => setShowEditReservationModal(true)}>
              Modify Reservation
            </button>
          </ul>
        </section>
      </div>
      {showEditReservationModal && (
        <Modal onClose={() => setShowEditReservationModal(false)}>
          <header className="modal-header">
            <i
              onClick={() => setShowEditReservationModal(false)}
              className="fa-solid fa-x"
            />
            <h3 className="modal-title">Edit Reservation</h3>
            <p> </p>
          </header>
          <EditReservationForm reservation={reservation} />
        </Modal>
      )}
    </>
  );
}

export default ReservationShow;
