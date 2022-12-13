import { useSelector, useDispatch } from "react-redux";
import { fetchProperties, fetchPropertiesByFranchise } from "../../store/properties";
import PropertiesList from "./PropertiesList";
import { useEffect } from "react";
import "./PropertiesIndex.css";
import PropertyFranchiseBar from "../PropertyFranchiseBar";
import { useParams } from "react-router-dom";


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

  return (
    <>
      <PropertyFranchiseBar/>
      <PropertiesList properties={properties} />
    </>
  );
}

export default PropertiesIndex;
