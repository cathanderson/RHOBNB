import React from "react";
import { useSelector } from "react-redux";
import LoggedInNav from "./LoggedInNav";
import LoggedOutNav from "./LoggedOutNav";
import "./Navigation.css";


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
        { sessionNav }
    </>
  );
}

export default Navigation;
