import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation";
import PropertiesIndex from "./components/PropertiesIndex";
import PropertyShowPage from "./components/PropertyShow";
import ReservationsIndex from "./components/ReservationsIndex";
import ReservationShow from "./components/ReservationShow";
import ProfileLinksFooter from "./components/ProfileLinksFooter/ProfileLinksFooter";

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path="/">
          <PropertiesIndex />
          <ProfileLinksFooter />
        </Route>
        <Route path="/properties/:id">
          <PropertyShowPage />
          <ProfileLinksFooter />
        </Route>
        <Route exact path="/reservations">
          <ReservationsIndex />
          <ProfileLinksFooter />
        </Route>
        <Route path="/reservations/:id">
          <ReservationShow />
          <ProfileLinksFooter />
        </Route>
        <Route path="/:rh_franchise">
          <PropertiesIndex />
          <ProfileLinksFooter />
        </Route>
        <Route path="/:search">
          <PropertiesIndex />
          <ProfileLinksFooter />
        </Route>
      </Switch>
    </>
  );
}

export default App;
