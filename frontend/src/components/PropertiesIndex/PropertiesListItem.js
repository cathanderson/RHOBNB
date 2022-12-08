import React from "react";
import { useHistory } from "react-router-dom";

function PropertiesListItem({ property }) {
  const {
    city,
    // description,
    // hostName,
    // lat,
    // lng,
    // numBaths,
    // numBeds,
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
      <div className="list-item-container">
        <ul className="list-item-fields">
          <li>
            <img
              className="list-item-image"
              src={property.photoUrls[0]}
              // src="https://rhobnb-seeds.s3.amazonaws.com/rhobnb_media/properties/rhony/bethenny_soho/bethenny_soho_1.png" // test url works!
              alt="Main property image"
            ></img>
          </li>
          <li>
            <h4 className="property-index-property-name">{propertyName}</h4>
          </li>
          <li className="property-index-city-state">
            {city}, {state}
          </li>
          <li className="property-index-price">
            <span className="property-index-price-span">${price} </span>
            <span className="property-index-night-span">night</span>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default PropertiesListItem;
