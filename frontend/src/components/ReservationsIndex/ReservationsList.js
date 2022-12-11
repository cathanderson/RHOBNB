import React from "react";
import ReservationsListItem from "./ReservationsListItem";

function ReservationsList({ reservations }) {
  return (
    <>
      <div className="reservations-list">
        {reservations.map((reservation) => (
          <ReservationsListItem key={reservation.id} reservation={reservation} />
        ))}
      </div>
    </>
  );
}

export default ReservationsList;
