import React from "react";
import PropertiesListItem from "./PropertiesListItem";

function PropertiesList({ properties }) {
  return (
    <>
      <section className="properties-list">
        {properties.map((property) => (
          <PropertiesListItem
            key={property.id}
            property={property}
          />
        ))}
      </section>
    </>
  );
}

export default PropertiesList;
