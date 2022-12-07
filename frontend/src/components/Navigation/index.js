import React from "react";
import { useSelector } from "react-redux";
import LoggedInNav from "./LoggedInNav";
import LoggedOutNav from "./LoggedOutNav";
import "./Navigation.css";
import LoginFormModal from "../LoginFormModal";
import NavSearch from "./NavSearch.js";
import { Link } from "react-router-dom";

function Navigation() {
  const sessionUser = useSelector((state) => state.session.user);

  let sessionNav;
  if (sessionUser) {
    sessionNav = <LoggedInNav/>;
  } else {
    sessionNav = <LoggedOutNav />;
  }

  //LOGIN FORM MODAL SHOULDN'T BE IN THIS COMPONENT, NEEDS TO BE IN LOGGED IN NAV COMPONENT
  return (
    <>
      <nav className="main-nav">
        <Link id="app-title-link" to="/">
          <h1 className="app-title">rhobnb</h1>
        </Link>
        <NavSearch />
        {sessionNav}
        {/* <LoginFormModal/>  */}
      </nav>
    </>
  );
}

export default Navigation;
