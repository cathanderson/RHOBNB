import { useSelector, useDispatch } from "react-redux";
import { fetchProperties } from "../../store/properties";
import PropertiesList from "./PropertiesList";
import { useEffect } from "react";
import "./PropertiesIndex.css"

function PropertiesIndex() {
  const properties = useSelector((state) => Object.values(state.properties));
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchProperties());
  }, []);

  return (
    <>
        <PropertiesList properties = {properties}/>
    </>
  )
}

export default PropertiesIndex;
