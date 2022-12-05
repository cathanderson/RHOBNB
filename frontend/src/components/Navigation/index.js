import React from "react";
import { useSelector } from "react-redux";
import LoggedInNav from "./LoggedInNav";
import LoggedOutNav from "./LoggedOutNav";
import "./Navigation.css";
import LoginFormModal from "../LoginFormModal";

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
      { sessionNav }
      {/* <LoginFormModal/>  */}
    </>
  );
}

export default Navigation;
