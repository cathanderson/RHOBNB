export const csrfFetch = async (url, options = {}) => {
  options.method ||= "GET";
  options.headers ||= {};

  if (options.method.toUpperCase() !== "GET") {
    options.headers["Content-Type"] = "application/json";
    options.headers["X-CSRF-Token"] = sessionStorage.getItem("X-CSRF-Token");
  }
  // debugger;
  const res = await fetch(url, options);
  return res;
};

export default csrfFetch;