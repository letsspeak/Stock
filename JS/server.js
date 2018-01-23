import React from 'react';
import { renderToString } from 'react-dom/server';
import { applyMiddleware, createStore } from 'redux'
import { Provider } from 'react-redux'

import { createLogger } from 'redux-logger'
import thunkMiddleware from 'redux-thunk'

import App from './components/App'
import rootReducer from './reducers'

export function render(preloadedState = undefined) {
  const store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(
      thunkMiddleware,
      createLogger()
    )
  )
  return {
    html: renderToString(
      <Provider store={store}>
        <App />
      </Provider>
    ),
    state: JSON.stringify(store.getState())
  };
}
