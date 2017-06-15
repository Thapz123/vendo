import React, { Component } from 'react';
import { Provider } from 'react-redux';
import {
  browserHistory,
  hashHistory,
  Router,
  Route,
  IndexRoute
} from 'react-router';
import { syncHistoryWithStore } from 'react-router-redux'
import configureStore from '../store/configureStore';

const store = configureStore();

const history = syncHistoryWithStore(browserHistory, store);

class RootContainer extends Component {
  constructor(props) {
    super(props);
  }

  render() {

    return (
      <Provider store={ store }>
        <Router history={ history }>
          <Route path='/' component={ App }>


          </Route>
        </Router>
      </Provider>
    );
  }
}
