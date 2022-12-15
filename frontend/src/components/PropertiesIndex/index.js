import { useSelector, useDispatch } from "react-redux";
import { fetchProperties, fetchPropertiesByFranchise } from "../../store/properties";
import PropertiesList from "./PropertiesList";
import { React, useEffect } from "react";
import "./PropertiesIndex.css";
import PropertyFranchiseBar from "../PropertyFranchiseBar";
import { useParams } from "react-router-dom";
import MapContainer from "../MapContainer";
import ProfileLinksFooter from "./ProfileLinksFooter";


function PropertiesIndex() {
  const { rh_franchise } = useParams();
  const properties = useSelector((state) => Object.values(state.properties));
  const dispatch = useDispatch();

  useEffect(() => {
    if (rh_franchise) {
      dispatch(fetchPropertiesByFranchise(rh_franchise))
    } else {
      dispatch(fetchProperties());
    }
  }, [dispatch, rh_franchise]);

  if (!rh_franchise) {
    return (
      <>
        <PropertyFranchiseBar />
        <PropertiesList properties={properties} />
        <ProfileLinksFooter />
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
        <ProfileLinksFooter/>
      </>
    );
  }
}

export default PropertiesIndex;
