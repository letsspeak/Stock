import React from 'react'
import { render } from 'react-dom'
import { createStore } from 'redux'
import { Provider } from 'react-redux'

import App from './components/App'
import reducer from './reducers'

import 'whatwg-fetch'
import 'es6-promise'

function load(state) {
  const store = createStore(reducer, state)
  render(
    <Provider store={store}>
  	  <App />
    </Provider>,
    document.getElementById('root')
  )
}

// Check if we can preload the state from a server-rendered page
if (window.__PRELOADED_STATE__) {
  load(window.__PRELOADED_STATE__);
} else {
  // We didn't prerender on the server, so we need to get our state
  fetch('/api/state')
    .then(
      response => response.json().then(load),
      err => console.error(err)
    );
}
