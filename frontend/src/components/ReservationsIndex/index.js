import { useSelector, useDispatch } from "react-redux";
import { getReservations, fetchReservations } from "../../store/reservations";
import ReservationsList from "./ReservationsList";
import { useEffect } from "react";
import "./ReservationsIndex.css";

function ReservationsIndex() {

  const dispatch = useDispatch();
  const reservations = useSelector(getReservations);

  useEffect(() => {
    dispatch(fetchReservations());
  }, []);

  return (
    <>
      <ReservationsList reservations={reservations} />
    </>
  );
}

export default ReservationsIndex;
