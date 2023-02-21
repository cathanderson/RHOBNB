import { useSelector, useDispatch } from "react-redux";
import { fetchProperties, fetchPropertiesByFranchise } from "../../store/properties";
import PropertiesList from "./PropertiesList";
import { React, useEffect } from "react";
import "./PropertiesIndex.css";
import PropertyFranchiseBar from "../PropertyFranchiseBar";
import { useParams } from "react-router-dom";
import MapContainer from "../MapContainer";


function PropertiesIndex() {
  const { rh_franchise } = useParams();
  const properties = useSelector((state) => Object.values(state.properties));
  const dispatch = useDispatch();

  const possibleFranchises = ["rhony", "rhonj", "rhobh", "rhoslc", "rhoa"];

  useEffect(() => {
    if (possibleFranchises.includes(rh_franchise)) {
      dispatch(fetchPropertiesByFranchise(rh_franchise));
    } else {
      dispatch(fetchProperties());
    }
  }, [dispatch, rh_franchise]);

  if (!possibleFranchises.includes(rh_franchise)) {
    return (
      <>
        <PropertyFranchiseBar />
        <main id="properties-list-and-map-container">
          <PropertiesList properties={properties} />
        </main>
      </>
    );
  } else {
    return (
      <>
        <PropertyFranchiseBar />
        <main id="properties-list-and-map-container">
          <PropertiesList properties={properties} />
          <MapContainer rh_franchise={rh_franchise} />
        </main>
      </>
    );
  }
}

export default PropertiesIndex;
