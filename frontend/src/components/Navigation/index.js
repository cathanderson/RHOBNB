import React from "react";
import { NavLink } from "react-router-dom";
import { useSelector } from "react-redux";
import ProfileButton from "./ProfileButton";
import "./Navigation.css";

function Navigation() {
  const sessionUser = useSelector((state) => state.session.user);

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = <ProfileButton user={sessionUser} />;
  } else {
    sessionLinks = (
      <>
        <NavLink to="/login">Log In</NavLink>
        <NavLink to="/signup">Sign Up</NavLink>
      </>
    );
  }

  return (
    <ul>
      <li>
        <NavLink exact to="/">
          Home
        </NavLink>
        {sessionLinks}
      </li>
    </ul>
  );
}

export default Navigation;

// MAINSESSIONNAV ATTEMPT - CSRF ISSUE

// import React, { useState, useEffect } from "react";
// import { NavLink } from "react-router-dom";
// import { useSelector, useDispatch } from "react-redux";
// import * as sessionActions from '../../store/session';

// function MainSessionNav() {
//   const user = useSelector((state) => state.session.user);
//   const dispatch = useDispatch();
//   const [showMenu, setShowMenu] = useState(false);

//   const openMenu = () => {
//     if (showMenu) return;
//     setShowMenu(true);
//   };

//   useEffect(() => {
//     if (!showMenu) return;

//     const closeMenu = () => {
//       setShowMenu(false);
//     };

//     document.addEventListener('click', closeMenu);

//     return () => document.removeEventListener("click", closeMenu);
//   }, [showMenu]);

//   const logout = (e) => {
//     e.preventDefault();
//     dispatch(sessionActions.logout());
//   };

//   if (user) {
//     return (
//     <>
//       <button onClick={openMenu}>
//         <i className="fa-solid fa-user-circle" />
//       </button>
//       {showMenu && (
//         <ul className="profile-dropdown">
//           <li>{user.username}</li>
//           <li>{user.email}</li>
//           <li>
//             <button onClick={logout}>Log Out</button>
//           </li>
//         </ul>
//       )}
//     </>
//   )} else {
//     return (
//       <>
//         <button onClick={openMenu}>
//           <i className="fa-solid fa-user-circle" />
//         </button>
//         {showMenu && (
//           <ul className="profile-dropdown">
//               <NavLink to="/login">Log In</NavLink>
//               <NavLink to="/signup">Sign Up</NavLink>
//           </ul>
//         )}
//       </>
//     );
//   }
// }

// export default MainSessionNav;
