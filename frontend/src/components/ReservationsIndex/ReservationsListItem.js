import React from "react";
import { useHistory } from "react-router-dom";

function PropertiesListItem({ reservation }) {
  const { guestId, propertyId, checkInDate, checkOutDate, numGuests } =
    reservation;
  const history = useHistory();

  // console.log(reservation.property.description);

  return (
    <div
      className={"reservations-list-item"}
      onClick={() => history.push(`/reservations/${reservation.id}`)}
    >
      <div className="reservations-list-item-container">
        <ul className="reservations-list-item-fields">
          <li>
            {reservation.property.city}, {reservation.property.state}
          </li>
          <li>{reservation.property.property_name}</li>
          <li>
            {checkInDate} - {checkOutDate}
          </li>

          <li>Number of Guests: {numGuests}</li>
          <br></br>
          {/* <li>
            <img
              className="list-item-image"
              src={reservation.photoUrls[0]}
              // src="https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_1.png" // test url works!
              alt="Main reservation image"
            ></img>
          </li>
          <li>
            <h4 className="reservation-index-reservation-name">
              {propertyName}
            </h4>
          </li>
          <li className="reservation-index-city-state">
            {city}, {state}
          </li>
          <li className="reservation-index-price">
            <span className="reservation-index-price-span">${price} </span>
            <span className="reservation-index-night-span">night</span>
          </li> */}
        </ul>
      </div>
    </div>
  );
}

export default PropertiesListItem;
