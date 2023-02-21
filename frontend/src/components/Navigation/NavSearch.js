import React, { useState } from "react";
import { useHistory } from "react-router-dom";

function NavSearch() {
  const [search, setSearch] = useState("");
  const history = useHistory();

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    if (search.length > 0) {
      history.push(`/${search}`);
    }
  };

  return (
    <>
      <div className="searchbar-container">
        <div className="searchbar-fields">
          <div className="searchbar-anywhere">Anywhere</div>
          <div className="searchbar-any-wife">Any wife</div>
          <div className="searchbar-add-guests">
            <form id="search-form" onSubmit={handleSearchSubmit}>
              <input
                type="text"
                placeholder="Search..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
              ></input>
              <button
                type="submit"
                className="fa-solid fa-magnifying-glass"
              ></button>
            </form>
          </div>
        </div>
      </div>
    </>
  );
}

export default NavSearch;
