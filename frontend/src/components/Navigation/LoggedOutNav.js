import React, { useState, useEffect } from "react";
import { NavLink } from "react-router-dom";
// import LoginFormModal from "../LoginFormModal/LoginForm";

function LoggedOutNav() {
  const [showMenu, setShowMenu] = useState(false);

  const openMenu = () => {
    if (showMenu) return;
    setShowMenu(true);
  };

  useEffect(() => {
    if (!showMenu) return;

    const closeMenu = () => {
      setShowMenu(false);
    };

    document.addEventListener("click", closeMenu);

    return () => document.removeEventListener("click", closeMenu);
  }, [showMenu]);

  return (
    <>
      <button onClick={openMenu}>
        <i className="fa-solid fa-user-circle" />
      </button>
      {showMenu && (
        <ul className="profile-dropdown">
          {/* <li>
            <LoginFormModal />
          </li> */}
          <li>
            <NavLink to="/signup">Sign Up</NavLink>
          </li>
          <li>
            <a href="https://github.com/cathanderson">Help</a>
          </li>
          <li>
            <a href="https://en.wikipedia.org/wiki/The_Real_Housewives">
              Learn more about the Real Housewives
            </a>
          </li>
        </ul>
      )}
    </>
  );
}

export default LoggedOutNav;
