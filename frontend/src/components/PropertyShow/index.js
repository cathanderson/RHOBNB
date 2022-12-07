import React, { useEffect, useState } from "react";
import { useParams} from "react-router-dom";

import { useDispatch, useSelector } from "react-redux";
import { fetchProperty } from "../../store/properties";
import "./PropertyShow.css";

function PropertyShowPage() {
  const dispatch = useDispatch();
  const { id } = useParams();

  const property = useSelector((state) => state.properties[id]);

  useEffect(() => {
    dispatch(fetchProperty(id));
  }, [id, dispatch]);

  if (!property) {
    return null;
  }

  const {
    city,
    description,
    hostName,
    lat,
    lng,
    numBaths,
    numBeds,
    price,
    propertyName,
    state,
  } = property;

  return (
    <div className="property-show">
      <div className="show-page-info-container">
        <ul className="show-page-fields">
          <li>
            <h4 className="show-page-property-name">{propertyName}</h4>
          </li>
          <li className="show-page-city-state-us">
            {city}, {state}, United States
          </li>
          <li className="show-page-hosted-by">Home hosted by {hostName}</li>
          <li className="show-page-room-details-container">
            <li className="show-page-num-beds-num-baths">
              <span>{numBeds} beds</span> · <span>{numBaths} baths</span>
            </li>
          </li>
          <li className="show-page-description">{description}</li>
          <li className="show-page-price">
            <span className="show-page-price-span">${price}</span>{" "}<span className="show-page-night-span">night</span>
          </li>
        </ul>
      </div>
    </div>
  );
}


export default PropertyShowPage;
