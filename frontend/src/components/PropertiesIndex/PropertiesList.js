import React from "react";
import PropertiesListItem from "./PropertiesListItem";

function PropertiesList({ properties }) {
  return (
    <>
      <div className="properties-list">
        {properties.map((property) => (
          <PropertiesListItem
            key={property.id}
            property={property}
          />
        ))}
      </div>
    </>
  );
}

export default PropertiesList;
