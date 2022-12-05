import React, { useState, useEffect } from "react";
import { NavLink } from "react-router-dom";
import { Modal } from "../../context/Modal";
import LoginForm from "../LoginFormModal/LoginForm";
import SignupForm from "../SignupFormPage";

function LoggedOutNav() {
  const [showMenu, setShowMenu] = useState(false);
  const [showLoginModal, setShowLoginModal] = useState(false);
  const [showSignupModal, setShowSignupModal] = useState(false);
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
      <div className="whole-profile-nav">
        <button onClick={openMenu} className="session-dropdown-button">
          <i className="fa-solid fa-bars" />
          <i id="user-circle" className="fa-solid fa-user-circle" />
        </button>
        {showMenu && (
          <ul className="profile-dropdown">
            <li onClick={() => setShowLoginModal(true)}>Log In</li>
            <li onClick={() => setShowSignupModal(true)}>Signup</li>
            <li>
              <a href="https://github.com/cathanderson">Help</a>
            </li>
            <li>
              <a href="https://en.wikipedia.org/wiki/The_Real_Housewives">
                Learn more about <br></br>the Real Housewives
              </a>
            </li>
          </ul>
        )}
      </div>
      {showLoginModal && (
        <Modal onClose={() => setShowLoginModal(false)}>
          <LoginForm />
        </Modal>
      )}
      {showSignupModal && (
        <Modal onClose={() => setShowSignupModal(false)}>
          <SignupForm />
        </Modal>
      )}
      {/* {showModal && <LoginFormModal />} */}
    </>
  );
}

export default LoggedOutNav;