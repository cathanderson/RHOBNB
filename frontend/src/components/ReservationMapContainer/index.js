import {
  GoogleMap,
  LoadScript,
  Marker,
  InfoWindow,
} from "@react-google-maps/api";
import { useState, React } from "react";
import ReservationMapStyles from "./ReservationMapStyles";
import house2 from "../../assets/images/home-icon-silhouette2.png";

const ReservationMapContainer = ({ reservation }) => {
  const [selected, setSelected] = useState({});

  const onSelect = (item) => {
    setSelected(item);
  };

  let defaultCenter = {
    lng: reservation.property.lng,
    lat: reservation.property.lat,
  };

  let location = {
    name: reservation.property.property_name,
    location: {
      lng: reservation.property.lng,
      lat: reservation.property.lat,
    },
  };

  const mapStyles = {
    height: "80vh",
    width: "100%",
  };

  return (
    <LoadScript googleMapsApiKey={process.env.REACT_APP_MAPS_API_KEY}>
      <GoogleMap
        mapContainerStyle={mapStyles}
        zoom={16}
        center={defaultCenter}
        options={{
          styles: ReservationMapStyles,
        }}
      >

          return (
            <Marker
              key={location.name}
              position={location.location}
              onClick={() => onSelect(location)}
              icon={house2}
            />
          );

        {selected.location && (
          <InfoWindow
            position={selected.location}
            clickable={true}
            onCloseClick={() => setSelected({})}
          >
            <p>{selected.name}</p>
          </InfoWindow>
        )}
      </GoogleMap>
    </LoadScript>
  );
};

export default ReservationMapContainer;
