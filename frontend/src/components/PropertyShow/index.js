import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import NewReservationForm from "../NewReservationForm";
import { useDispatch, useSelector } from "react-redux";
import { fetchProperty } from "../../store/properties";
import "./PropertyShow.css";

function PropertyShowPage() {
  const dispatch = useDispatch();
  const { id } = useParams();

  // debugger
  useEffect(() => {
    dispatch(fetchProperty(id));
  }, [id, dispatch]);

  const property = useSelector((state) => state.properties[id]);
  // debugger

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

  let bedDetails;
  if (numBeds === 1) {
    bedDetails = <span>{numBeds} bedroom</span>;
  } else {
    bedDetails = <span>{numBeds} bedrooms</span>;
  }

  let bathDetails;
  if (numBaths === 1) {
    bathDetails = <span>{numBaths} bath</span>;
  } else {
    bathDetails = <span>{numBaths} baths</span>;
  }

  const splitPropertyName = propertyName.split(" ");
  const propertyType = splitPropertyName[splitPropertyName.length - 1];

    return (
      <div className="property-show">
        <section className="show-page-info-container">
          <ul className="show-page-fields">
            <li>
              <h4 className="show-page-property-name">{propertyName}</h4>
            </li>
            <li className="show-page-city-state-us">
              {city}, {state}, United States
            </li>
            <li>
              <div className="property-show-image-container">
                <div className="main-property-show-image-container">
                  <img
                    className="main-property-show-image"
                    src={property.photoUrls[0]}
                  ></img>
                </div>
                <div className="non-main-property-show-image-container">
                  <img
                    className="non-main-property-show-image"
                    src={property.photoUrls[1]}
                  ></img>
                  <img
                    className="non-main-property-show-image"
                    id="third-show-page-image"
                    src={property.photoUrls[2]}
                  ></img>
                  <img
                    className="non-main-property-show-image"
                    src={property.photoUrls[3]}
                  ></img>
                  <img
                    className="non-main-property-show-image"
                    id="fifth-show-page-image"
                    src={property.photoUrls[4]}
                  ></img>
                </div>
              </div>
            </li>
            {/* <li className="show-page-price">
            <span className="show-page-price-span">${price}</span>{" "}
            <span className="show-page-night-span">night</span>
          </li> */}
          </ul>
        </section>
        <section className="bottom-show-page-container">
          <section className="bottom-left-show-page-info-container">
            <div className="show-page-hosted-by">
              {propertyType} hosted by {hostName}
            </div>
            <div className="show-page-room-details-container">
              <div className="show-page-num-beds-num-baths">
                {bedDetails} · {bathDetails}
              </div>
            </div>
            <div className="show-page-description">{description}</div>
          </section>
          <section className="bottom-right-show-page-container">
            <div className="show-page-reservation-form-container">
              <h4 className="show-page-price">
                <span className="show-page-price-span">${price}</span>{" "}
                <span className="show-page-night-span">night</span>
              </h4>
              <NewReservationForm />
            </div>
          </section>
        </section>
      </div>
    );
}

export default PropertyShowPage;
