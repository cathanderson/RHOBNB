import React from "react";
import { GoogleMap, LoadScript } from "@react-google-maps/api";
// import REACT_APP_MAPS_API_KEY from "../../../env.development.local"

const MapContainer = ({ rh_franchise }) => {

  console.log(rh_franchise)

  const mapStyles = {
    height: "100vh",
    width: "100%",
  };

  const defaultCenter = {
    lat: 41.3851,
    lng: 2.1734,
  };

  return (
    // <section className="map-container">
    <LoadScript googleMapsApiKey={process.env.REACT_APP_MAPS_API_KEY}>
      <GoogleMap
        mapContainerStyle={mapStyles}
        zoom={13}
        center={defaultCenter}
      />
    </LoadScript>
    // </section>
  );
};

export default MapContainer;
