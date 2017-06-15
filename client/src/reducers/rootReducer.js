import { combineReducers } from 'redux';
import { routerReducer as routing } from 'react-router-redux';

import auth from './authReducer';

export default const rootReducer = combineReducers({
  auth,
  routing
});
