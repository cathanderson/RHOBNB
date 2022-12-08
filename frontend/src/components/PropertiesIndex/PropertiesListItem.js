import React from "react";
import { useHistory } from "react-router-dom";

function PropertiesListItem({ property }) {
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
  const history = useHistory();

  return (
    <div
      className={"properties-list-item"}
      onClick={() => history.push(`/properties/${property.id}`)}
    >
      <div className="list-item-info-container">
        <ul className="list-item-fields">
          <li>
            <h4 className="property-index-property-name">{propertyName}</h4>
          </li>
          <li className="property-index-city-state">
            {city}, {state}
          </li>
          <li className="property-index-price">
            ${price} <span className="property-index-night-span">night</span>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default PropertiesListItem;