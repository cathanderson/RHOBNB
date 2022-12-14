// import React from "react";
// import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";
// import { useSelector } from "react-redux";
// import { getProperties } from "../../store/properties";

// const MapContainer = ({ rh_franchise }) => {
//   const properties = useSelector(getProperties);
//   console.log(properties[0].lng);

//   let locations;
//   let defaultCenter;
//   let zoomAmount;

//   if (rh_franchise === "rhony") {
//     locations = [
//       {
//         name: properties[0].property_name,
//         location: {
//           lng: properties[0].lng,
//           lat: properties[0].lat,
//         },
//       },
//     ];
//     defaultCenter = {
//       lng: -73.98017854605482,
//       lat: 40.75825220218335,
//     };
//     zoomAmount = 10;
//   }

//   const mapStyles = {
//     height: "100vh",
//     width: "100%",
//   };

//   return (
//     <LoadScript googleMapsApiKey={process.env.REACT_APP_MAPS_API_KEY}>
//       <GoogleMap
//         mapContainerStyle={mapStyles}
//         zoom={zoomAmount}
//         center={defaultCenter}
//       >
//         {locations.map((item) => {
//           return <Marker key={item.name} position={item.location} />;
//         })}
//       </GoogleMap>
//     </LoadScript>
//   );
// };

// export default MapContainer;


import React from "react";
import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";
import { useSelector } from "react-redux";
import { getProperties } from "../../store/properties";

const MapContainer = ({ rh_franchise }) => {
  const properties = useSelector(getProperties);

  let defaultCenters = {
    rhony: {
      lng: -73.98017854605482,
      lat: 40.75825220218335,
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
    rhony: 12.5,
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
    };
  });

  console.log(defaultCenters);

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
      >
        {Object.values(locations).map((item) => {
          return <Marker key={item.name} position={item.location} />;
        })}
      </GoogleMap>
    </LoadScript>
  );
};

export default MapContainer;