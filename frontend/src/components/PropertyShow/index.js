import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import NewReservationForm from "../NewReservationForm";
import { useDispatch, useSelector } from "react-redux";
import { fetchProperty } from "../../store/properties";
import wifi from "../../assets/amenities_icons/wifi.png"
import kitchen from "../../assets/amenities_icons/kitchen.png";
import washer from "../../assets/amenities_icons/washer.png";
import parking from "../../assets/amenities_icons/parking.png";
import gym from "../../assets/amenities_icons/gym.png";
import entertaining from "../../assets/amenities_icons/entertaining.png";
import bar from "../../assets/amenities_icons/bar.png";
import psychic from "../../assets/amenities_icons/psychic.png";
import peacock from "../../assets/amenities_icons/peacock.png";
import syringe from "../../assets/amenities_icons/syringe.png";
import aircover from "../../assets/images/aircover.webp"
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

  // console.log(property.photoUrls);

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
            <div className="show-page-hosted-by-room-details-image-container">
              <div className="show-page-hosted-by-room-details-container">
                <div className="show-page-hosted-by">
                  {propertyType} hosted by {hostName}
                </div>
                <div className="show-page-room-details-container">
                  <div className="show-page-num-beds-num-baths">
                    {bedDetails} · {bathDetails}
                  </div>
                </div>
              </div>
              <div className="show-page-hosted-by-image-container">
                <img
                  className="non-main-property-show-image"
                  id="host-show-page-image"
                  src={property.photoUrls[5]}
                ></img>
              </div>
            </div>
            <div className="show-page-description">{description}</div>
            <div className="aircover-container">
              <div className="aircover-icon-container">
                <img className="aircover-icon" src={aircover} />
              </div>
              <div className="aircover-copy-container">
                Every booking includes free protection from Host cancellations,
                listing inaccuracies, and other drama like trouble checking in.
              </div>
            </div>
            <div className="what-this-place-offers-container">
              <div className="what-this-place-offers-heading-container">
                <h5 className="what-this-place-offers-heading">
                  What this place offers
                </h5>
              </div>
              <div className="what-this-place-offers-content-container">
                <div className="left-what-this-place-offers-content-container">
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={wifi} />
                    </div>
                    <div className="offering-copy-container">Wifi</div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={kitchen} />
                    </div>
                    <div className="offering-copy-container">Kitchen</div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={washer} />
                    </div>
                    <div className="offering-copy-container">Washer/dryer</div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={parking} />
                    </div>
                    <div className="offering-copy-container">Parking</div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={gym} />
                    </div>
                    <div className="offering-copy-container">
                      Fitness studio
                    </div>
                  </div>
                </div>
                <div className="right-what-this-place-offers-content-container">
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={entertaining} />
                    </div>
                    <div className="offering-copy-container">
                      Entertaining space
                    </div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={bar} />
                    </div>
                    <div className="offering-copy-container">Open bar</div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={psychic} />
                    </div>
                    <div className="offering-copy-container">
                      Psychic Readings
                    </div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={peacock} />
                    </div>
                    <div className="offering-copy-container">
                      Free streaming with Peacock
                    </div>
                  </div>
                  <div className="offering-container">
                    <div className="offering-icon-container">
                      <img className="offering-icon" src={syringe} />
                    </div>
                    <div className="offering-copy-container">
                      Free Botox referral
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
