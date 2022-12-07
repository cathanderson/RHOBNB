import csrfFetch from "./csrf";

const SET_PROPERTIES = "properties/setProperties";

const setProperties = (properties) => ({
  type: SET_PROPERTIES,
  payload: properties,
});

export const fetchProperties = () => async (dispatch) => {
  const response = await csrfFetch(`/api/properties`);
  const data = await response.json();
  dispatch(setProperties(data.properties));
  //   return data;
};

function propertiesReducer(state = {}, action) {
  switch (action.type) {
    case SET_PROPERTIES:
      return action.payload;
    // case ADD_BENCH:
    //   const bench = action.payload;
    //   return { ...state, [bench.id]: bench };
    default:
      return state;
  }
}

export default propertiesReducer;
