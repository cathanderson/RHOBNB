import React from "react";
import { useSelector } from "react-redux";
import LoggedInNav from "./LoggedInNav";
import LoggedOutNav from "./LoggedOutNav";
import "./Navigation.css";
import LoginFormModal from "../LoginFormModal";
import NavSearch from "./NavSearch.js";
import { Link } from "react-router-dom";
import dress from "../../assets/images/dress.png"

function Navigation() {
  const sessionUser = useSelector((state) => state.session.user);

  let sessionNav;
  if (sessionUser) {
    sessionNav = <LoggedInNav/>;
  } else {
    sessionNav = <LoggedOutNav />;
  }

  return (
    <>
      <nav className="main-nav">
        <Link id="app-title-link" to="/">
          <h1 className="app-title">
            <img id="app-logo" src={dress}/>
            rhobnb
            </h1>
        </Link>
        <NavSearch />
        {sessionNav}
        {/* <LoginFormModal/>  */}
      </nav>
    </>
  );
}

export default Navigation;
