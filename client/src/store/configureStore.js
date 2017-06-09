import {
  createStore,
  compose
} from 'redux';

import rootReducer from '../reducers/rootReducer';
import rootMiddleware from '../middleware/rootMiddleware';

export default const configureStore = () => {
  const initialState = {};

  const store = createStore(
    rootReducer,
    initialState,
    compose(
      rootMiddleware,
      window.devToolsExtension ? window.devToolsExtension() : f => f
    )
  );

  return store;
};
