import React from 'react'
import ReactDOM from 'react-dom'
import { applyMiddleware, createStore } from 'redux'
import { Provider } from 'react-redux'

import { createLogger } from 'redux-logger'
import thunkMiddleware from 'redux-thunk'

import { BrowserRouter as Router, Route, browserHistory } from 'react-router-dom'
import rootReducer from './reducers'

import axios from 'axios'
import 'whatwg-fetch'
import 'es6-promise'

import Layout from './components/Layout'
import Portfolio from './components/Portfolio'
import TaskApp from './components/TaskApp'
import BlogApp from './components/BlogApp'

function load(state, renderMethod) {
  const store = createStore(
    rootReducer,
    state,
    applyMiddleware(
      thunkMiddleware,
      createLogger()
    )
  )
  renderMethod(
    <Provider store={store}>
      <Router history={browserHistory}>
        <Layout>
          <Route exact path="/" component={Portfolio} />
          <Route path="/tasks" component={TaskApp} />
          <Route path="/blog" component={BlogApp} />
        </Layout>
      </Router>
    </Provider>,
    document.getElementById('root')
  )
}

// Check if we can preload the state from a server-rendered page
if (window.__PRELOADED_STATE__) {
  load(window.__PRELOADED_STATE__, ReactDOM.hydrate);
} else {
  // We didn't prerender on the server, so we need to get our state
  axios.get('/api/todo/tasks')
    .then(response => load({ "tasks": response.data }, ReactDOM.render))
    .catch(error => console.log(error))
}
