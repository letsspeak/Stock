import React from 'react';
import { renderToString } from 'react-dom/server';
import { createStore } from 'redux';
import { Provider } from 'react-redux';

import App from './components/App'
import reducer from './reducers'

export function render(preloadedState = undefined) {
  const store = createStore(reducer, preloadedState);
  return {
    html: renderToString(
      <Provider store={store}>
        <App />
      </Provider>
    ),
    state: JSON.stringify(store.getState())
  };
}
