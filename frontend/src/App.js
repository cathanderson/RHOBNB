import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation";
import PropertiesIndex from "./components/PropertiesIndex";
import PropertyShowPage from "./components/PropertyShow";
import ReservationsIndex from "./components/ReservationsIndex";
import ReservationShow from "./components/ReservationShow";

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path="/">
          <PropertiesIndex />
        </Route>
        <Route path="/properties/:id">
          <PropertyShowPage />
        </Route>
        <Route exact path="/reservations">
          <ReservationsIndex />
        </Route>
        <Route path="/reservations/:id">
          <ReservationShow />
        </Route>
        <Route path="/:rh_franchise">
          <PropertiesIndex />
        </Route>
      </Switch>
    </>
  );
}

export default App;
