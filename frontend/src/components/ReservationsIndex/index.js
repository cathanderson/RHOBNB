import { useSelector, useDispatch } from "react-redux";
import { getReservations, fetchReservations } from "../../store/reservations";
import ReservationsList from "./ReservationsList";
import { useEffect } from "react";
import "./ReservationsIndex.css";

function ReservationsIndex() {
  // const reservations = useSelector((state) => Object.values(state.reservations));
  const dispatch = useDispatch();
  const reservations = useSelector(getReservations);

  //   const reservations = Object.values(fetchReservations());
  //   debugger

  // let reservations = dispatch(fetchReservations());
  // debugger

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
