import {
  GoogleMap,
  LoadScript,
  Marker,
  InfoWindow,
} from "@react-google-maps/api";
import { useSelector } from "react-redux";
import { getProperties } from "../../store/properties";
import { useState, React } from "react";
import rhobnbMapStyles from "./GoogleMapsStyles";
import house from "../../assets/images/home-icon-silhouette.png"
import pin from "../../assets/images/placeholder.png";
import { Link } from "react-router-dom";

const MapContainer = ({ rh_franchise }) => {
  const properties = useSelector(getProperties);

  const [selected, setSelected] = useState({});

  const onSelect = (item) => {
    setSelected(item);
  };

  let defaultCenters = {
    rhony: {
      lng: -73.98772938211399,
      lat: 40.74694716164171,
    },
    rhonj: {
      lng: -74.19496009763303,
      lat: 40.905374300770426,
    },
    rhobh: {
      lng: -118.43215308090113,
      lat: 34.06132233736488,
    },
    rhoslc: {
      lng: -111.74122952661914,
      lat: 40.653710288478784,
    },
    rhoa: {
      lng: -84.25407173324143,
      lat: 33.84412178411214,
    },
  };

  let zoomAmounts = {
    rhony: 13,
    rhonj: 10.5,
    rhobh: 10.45,
    rhoslc: 10.45,
    rhoa: 11,
  };

  let locations = {};

  properties.forEach((property) => {
    locations[property.id] = {
      name: property.propertyName,
      location: {
        lng: property.lng,
        lat: property.lat,
      },
      id: property.id,
    };
  });

  const mapStyles = {
    height: "100vh",
    width: "100%",
  };

  return (
    <LoadScript googleMapsApiKey={process.env.REACT_APP_MAPS_API_KEY}>
      <GoogleMap
        mapContainerStyle={mapStyles}
        zoom={zoomAmounts[rh_franchise]}
        center={defaultCenters[rh_franchise]}
        options={{
          styles: rhobnbMapStyles,
        }}
      >
        {Object.values(locations).map((item) => {
          return (
            <Marker
              key={item.name}
              position={item.location}
              onClick={() => onSelect(item)}
              icon={pin}
            />
          );
        })}
        {selected.location && (
          <InfoWindow
            position={selected.location}
            clickable={true}
            onCloseClick={() => setSelected({})}
          >
              <Link className="map-property-link" to={`/properties/${selected.id}`}>{selected.name}</Link>
          </InfoWindow>
        )}
      </GoogleMap>
    </LoadScript>
  );
};

export default MapContainer;
