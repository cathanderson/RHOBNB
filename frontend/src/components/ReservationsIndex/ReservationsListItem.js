import React from "react";
import { useHistory } from "react-router-dom";

function PropertiesListItem({ reservation }) {
  const { guestId, propertyId, checkInDate, checkOutDate, numGuests } =
    reservation;
  const history = useHistory();

  // console.log(reservation.property.photoUrls);

  // let propertyImage;
  // if (reservation.property.photoUrls) {
  //   propertyImage = (
  //     <img
  //       className="reservation-list-property-image"
  //       src={reservation.property.photoUrls[0]}
  //     ></img>
  //   );
  // }

  const monthNames = {
    "1":"January",
    2:"February",
    3:"March",
    4:"April",
    5:"May",
    6:"June",
    7:"July",
    8:"August",
    9:"September",
    10:"October",
    11:"November",
    12:"December",
};


  const checkInMonth =
    monthNames[parseInt(checkInDate.split("-")[1])];
  const checkInDay = checkInDate.split("-")[2];

  const checkOutMonth = monthNames[parseInt(checkOutDate.split("-")[1])];
  const checkOutDay = checkOutDate.split("-")[2];

  return (
    <div
      className={"reservations-list-item"}
      onClick={() => history.push(`/reservations/${reservation.id}`)}
    >
      <div className="reservations-list-item-container">
        <ul className="reservations-list-item-fields-container">
          <li className="reservations-list-item-location">
            {reservation.property.city}, {reservation.property.state}
          </li>
          <li className="reservations-list-item-property-name">
            {reservation.property.property_name}
          </li>
          <li className="reservations-list-item-dates">
            {checkInMonth} {checkInDay} - {checkOutMonth} {checkOutDay}
          </li>
        </ul>
        <div className="reservations-list-item-image-container">
          {/* {propertyImage} */}
        </div>
      </div>
    </div>
  );
}

export default PropertiesListItem;
