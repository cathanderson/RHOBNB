import React from "react";
import ReservationsListItem from "./ReservationsListItem";

function ReservationsList({ reservations }) {
  return (
    <div className="actual-entire-reservation-index">
      <div className="trips-title-container">
        <h2 className="trips-title">Trips</h2>
      </div>
      <div className="whole-reservation-index-page-container">
        <div className="reservations-list-container">
          {reservations.map((reservation) => (
            <ReservationsListItem
              key={reservation.id}
              reservation={reservation}
            />
          ))}
        </div>
      </div>
    </div>
  );
}

export default ReservationsList;
