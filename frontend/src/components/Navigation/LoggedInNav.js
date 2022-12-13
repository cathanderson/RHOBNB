import React, { useState, useEffect } from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from "../../store/session";
import { Link, useHistory } from "react-router-dom";

function LoggedInNav() {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  const history = useHistory();

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

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
    history.push(`/`);
  };

  return (
    <>
      <div className="whole-profile-nav">
        <button onClick={openMenu} className="session-dropdown-button">
          <i className="fa-solid fa-bars" />
          <i className="fa-solid fa-user-circle" />
        </button>
        {showMenu && (
          <ul className="profile-dropdown">
            {/* <div className="bold-dropdown-options"> */}
            {/* <li>Messages</li> */}
            <li>
              <Link to="/reservations">Trips</Link>
            </li>
            {/* <li>Wishlists</li> */}
            {/* </div> */}
            <li>
              <a href="https://github.com/cathanderson">Help</a>
            </li>
            <li>
              <a href="https://en.wikipedia.org/wiki/The_Real_Housewives">
                Learn more about <br></br>the Real Housewives
              </a>
            </li>
            <li className="clickable-option" onClick={logout}>
              Log out
            </li>
          </ul>
        )}
      </div>
    </>
  );
}

export default LoggedInNav;
