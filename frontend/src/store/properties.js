import csrfFetch from "./csrf";

const SET_PROPERTIES = "properties/setProperties";
const ADD_PROPERTY = "properties/addProperty";

const setProperties = (properties) => ({
  type: SET_PROPERTIES,
  payload: properties,
});

export const addProperty = (property) => ({
  type: ADD_PROPERTY,
  payload: property,
});

export const fetchProperties = () => async (dispatch) => {
  const response = await csrfFetch(`/api/properties`);
  const data = await response.json();
  dispatch(setProperties(data.properties));
  //   return data;
  return response;
};

export const fetchProperty = (propertyId) => async (dispatch) => {
  const response = await csrfFetch(`/api/properties/${propertyId}`);
  const data = await response.json();
//   console.log(data)
    // debugger
  dispatch(addProperty(data));
//   return response;
};

function propertiesReducer(state = {}, action) {
  switch (action.type) {
    case SET_PROPERTIES:
      return action.payload;
    case ADD_PROPERTY:
      const property = action.payload;
    //   debugger
      return { ...state, [property.id]: property };
    default:
      return state;
  }
}

export default propertiesReducer;
