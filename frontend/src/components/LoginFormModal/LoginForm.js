import React, { useState } from "react";
import * as sessionActions from "../../store/session";
import { useDispatch } from "react-redux";
import "./LoginForm.css";

function LoginForm() {
  const dispatch = useDispatch();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    // debugger
    // console.log("test1");
    return dispatch(sessionActions.login({ email, password })).catch(
      async (res) => {
        let data;
        // console.log("test2")
        // debugger;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }

        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      }

    );
    // dispatch(sessionActions.login({ email, password }))
    //   .then((res) => console.log(res))
    //   .catch((err) => {
    //     console.log("my error", err);
    //   });
  };

  const loginDemo = () => {
    const demoUser = {
      email: "demo@rhobnb.com",
      password: "password",
    };
    dispatch(sessionActions.login(demoUser));
  };

  return (
    <>
      <h3 className="login-form-title">Welcome to RHOBNB</h3>
      <form onSubmit={handleSubmit} className="login-form">
        <input
          type="text"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Email"
          required
        />
        <input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Password"
          required
        />
        <ul className="form-errors">
          {errors.map((error) => (
            <li key={error}>{error}</li>
          ))}
        </ul>
        <button type="submit">Log in</button>
      </form>
      <button className="demo-user-login-button" onClick={loginDemo}>Log in as Demo User</button>
    </>
  );
}

export default LoginForm;
