import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation";
import PropertiesIndex from "./components/PropertiesIndex";
import PropertyShowPage from "./components/PropertyShow";

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
      </Switch>
    </>
  );
}

export default App;
