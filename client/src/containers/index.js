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
