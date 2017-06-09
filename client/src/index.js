import React from 'react';
import ReactDOM from 'react-dom';
// TODO: Change to containers/index later
import App from './containers/AppContainer';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();
