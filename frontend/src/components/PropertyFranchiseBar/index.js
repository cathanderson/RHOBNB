import { useSelector, useDispatch } from "react-redux";
import { fetchProperties } from "../../store/properties";
import { useEffect } from "react";
import { Link } from "react-router-dom";
import "./PropertyFranchiseBar.css";
import tv from "../../assets/category-icons/tv.png";
import apple from "../../assets/category-icons/apple.png";
import pizza from "../../assets/category-icons/pizza-slice.png";
import diamond from "../../assets/category-icons/diamond.png";
import snowflake from "../../assets/category-icons/snowflake.png";
import peach from "../../assets/category-icons/peach.png";


function PropertyFranchiseBar() {

  return (
    <>
      <div className="franchises-icons-container">
        <Link className="franchise-link" to={`/`}>
          <div className="franchise-icon-container">
            <img className="franchise-icon" src={tv} />
            <label className="franchise-icon-label">All properties</label>
          </div>
        </Link>
        <Link className="franchise-link" to={`/rhony`}>
          <div className="franchise-icon-container">
            <img className="franchise-icon" src={apple} />
            <label className="franchise-icon-label">New York</label>
          </div>
        </Link>
        <Link className="franchise-link" to={`/rhonj`}>
          <div className="franchise-icon-container">
            <img className="franchise-icon" src={pizza} />
            <label className="franchise-icon-label">New Jersey</label>
          </div>
        </Link>
        <Link className="franchise-link" to={`/rhobh`}>
          <div className="franchise-icon-container">
            <img className="franchise-icon" src={diamond} />
            <label className="franchise-icon-label">Beverly Hills</label>
          </div>
        </Link>
        <Link className="franchise-link" to={`/rhoslc`}>
          <div className="franchise-icon-container">
            <img className="franchise-icon" src={snowflake} />
            <label className="franchise-icon-label">Salt Lake City</label>
          </div>
        </Link>
        <Link className="franchise-link" to={`/rhoa`}>
          <div className="franchise-icon-container">
            <img className="franchise-icon" src={peach} />
            <label
              id="franchise-icon-label-atlanta"
              className="franchise-icon-label"
            >
              Atlanta
            </label>
          </div>
        </Link>
      </div>
    </>
  );
}

export default PropertyFranchiseBar;
