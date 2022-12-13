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

  if (!reservation) {
    return null;
  }

  // console.log(reservation.property);

  const { guestId, propertyId, checkInDate, checkOutDate, numGuests } =
    reservation;

  // console.log(reservation.property.description)

  const handleCancelClick = () => {
    dispatch(deleteReservation(id));
    history.push(`/reservations`);
    // <Redirect to="/reservations" />
  };

    const monthNames = {
      1: "January",
      2: "February",
      3: "March",
      4: "April",
      5: "May",
      6: "June",
      7: "July",
      8: "August",
      9: "September",
      10: "October",
      11: "November",
      12: "December",
    };

    const checkInMonth = monthNames[parseInt(checkInDate.split("-")[1])];
    const checkInDay = checkInDate.split("-")[2];

    const checkOutMonth = monthNames[parseInt(checkOutDate.split("-")[1])];
    const checkOutDay = checkOutDate.split("-")[2];

  return (
    <>
      <div className="reservation-show">
        <section className="reservation-show-page-info-container">
          <ul className="reservation-show-page-fields">
            <li className="reservation-show-page-hosts-place">
              Your stay at {reservation.property.host_name}'s place
            </li>
            <li className="reservation-show-page-description">
              {reservation.property.description}
            </li>
            <li className="reservation-show-page-dates-container">
              <div className="reservation-show-page-check-in-date-container">
                <div className="reservation-show-page-check-in">Check-in</div>
                <div className="reservation-show-page-check-in-date">
                  {checkInMonth} {checkInDay}
                </div>
                <div className="reservation-show-page-check-in-time">
                  4:00 PM
                </div>
              </div>
              <div className="reservation-show-page-check-out-date-container">
                <div className="reservation-show-page-check-out">Checkout</div>
                <div className="reservation-show-page-check-out-date">
                  {checkOutMonth} {checkOutDay}
                </div>
                <div className="reservation-show-page-check-out-time">
                  10:00 AM
                </div>
              </div>
            </li>
            <li className="reservation-show-page-getting-there-container">
              <div className="reservation-show-page-getting-there-icon-container">
                <i class="fa-solid fa-location-dot"></i>
              </div>
              <div className="reservation-show-page-getting-there-info-container">
                <div className="reservation-show-page-getting-there">
                  Getting there
                </div>
                <div className="reservation-show-page-getting-there-location">
                  {reservation.property.city}, {reservation.property.state}
                </div>
              </div>
            </li>
            <li className="reservation-show-page-your-place-container">
              <div className="reservation-show-page-your-place-icon-container">
                <i class="fa-solid fa-house"></i>
              </div>
              <div className="reservation-show-page-your-place-info-container">
                <div className="reservation-show-page-your-place">
                  Your place
                </div>
                <div className="reservation-show-page-your-place-property-name">
                  {reservation.property.property_name}
                </div>
              </div>
            </li>
            <li className="reservation-show-page-whos-coming-container">
              <div className="reservation-show-page-whos-coming-icon-container">
                <i class="fa-solid fa-people-group"></i>
              </div>
              <div className="reservation-show-page-whos-coming-info-container">
                <div className="reservation-show-page-whos-coming">
                  Who's coming
                </div>
                <div className="reservation-show-page-whos-coming-num-guests">
                  {numGuests} guests
                </div>
              </div>
            </li>

            <div className="reservation-show-page-button-container">
              <button onClick={() => setShowEditReservationModal(true)}>
                Modify Reservation
              </button>
              <button onClick={handleCancelClick}>Cancel Reservation</button>
            </div>
          </ul>
        </section>
        <section className="reservation-show-page-map-container">
          <img
            className="reservation-show-page-map-placeholder"
            src="https://www.maps-of-the-usa.com/maps/usa/new-york/new-york/large-detailed-road-map-of-south-manhattan-nyc-small.jpg"
          ></img>
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
          <EditReservationForm
            reservation={reservation}
            visible={setShowEditReservationModal }
          />
        </Modal>
      )}
    </>
  );
}

export default ReservationShow;
