import React from "react";
import { Route, Switch } from "react-router-dom";
import SignupFormPage from "./components/SignupFormPage";
import Navigation from "./components/Navigation";
import PropertiesIndex from "./components/PropertiesIndex";

function App() {
  return (
    <>
      <Navigation/>
        <Switch>
          <Route exact path="/">
            <PropertiesIndex />
          </Route>
        </Switch>
    </>
  );
}

export default App;
