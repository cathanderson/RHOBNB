import React from "react";

function NavSearch() {
  return (
    <>
      <div className="searchbar-container">
        <div className="searchbar-fields">
          <div className="searchbar-anywhere">Anywhere</div>
          <div className="searchbar-any-wife">Any wife</div>
          <div className="searchbar-add-guests">
            <form id="search-form">
              <input type="text" placeholder="Search..."></input>
              <button className="fa-solid fa-magnifying-glass"></button>
            </form>
          </div>
        </div>
      </div>
    </>
  );
}

export default NavSearch;
