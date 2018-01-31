import React from 'react'
import { render } from 'react-dom'
import { applyMiddleware, createStore } from 'redux'

import { createLogger } from 'redux-logger'
import thunkMiddleware from 'redux-thunk'

import Root from './components/Root'
import rootReducer from './reducers'

import axios from 'axios'
import 'whatwg-fetch'
import 'es6-promise'

function load(state) {
  const store = createStore(
    rootReducer,
    state,
    applyMiddleware(
      thunkMiddleware,
      createLogger()
    )
  )
  render(
    <Root store={store} />,
    document.getElementById('root')
  )
}

// Check if we can preload the state from a server-rendered page
if (window.__PRELOADED_STATE__) {
  load(window.__PRELOADED_STATE__);
} else {
  // We didn't prerender on the server, so we need to get our state
  axios.get('/api/todo/tasks')
    .then(response => load({ "tasks": response.data }))
    .catch(error => console.log(error))
}
