import { useSelector, useDispatch } from "react-redux";
import { fetchProperties } from "../../store/properties";
import PropertiesList from "./PropertiesList";
import { useEffect } from "react";
import "./PropertiesIndex.css";
import tv from "../../assets/category-icons/tv.png";
import apple from "../../assets/category-icons/apple.png";
import pizza from "../../assets/category-icons/pizza-slice.png";
import snowflake from "../../assets/category-icons/snowflake.png";
import peach from "../../assets/category-icons/peach.png";


function PropertiesIndex() {
  const properties = useSelector((state) => Object.values(state.properties));
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchProperties());
  }, []);

  return (
    <>
      <div className="categories-icons-container">
        <div className="category-icon-container">
          <img className="category-icon" src={tv} />
          <label className="category-icon-label">All properties</label>
        </div>
        <div className="category-icon-container">
          <img className="category-icon" src={apple} />
          <label className="category-icon-label">New York</label>
        </div>
        <div className="category-icon-container">
          <img className="category-icon" src={pizza} />
          <label className="category-icon-label">New Jersey</label>
        </div>
        <div className="category-icon-container">
          <img className="category-icon" src={snowflake} />
          <label className="category-icon-label">Salt Lake City</label>
        </div>
        <div className="category-icon-container">
          <img className="category-icon" src={peach} />
          <label id="category-icon-label-atlanta" className="category-icon-label">
            Atlanta
          </label>
        </div>
      </div>
      <PropertiesList properties={properties} />
    </>
  );
}

export default PropertiesIndex;
