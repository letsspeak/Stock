import React from 'react';
import { renderToString } from 'react-dom/server';
import { createStore } from 'redux'
import { Provider } from 'react-redux'

import { StaticRouter as Router, Route } from 'react-router-dom'
import rootReducer from './reducers'

import Layout from './components/Layout'
import Portfolio from './components/Portfolio'
import TaskApp from './components/TaskApp'
import BlogApp from './components/BlogApp'

export function render(path = '/', preloadedState = undefined) {
  const store = createStore(
    rootReducer,
    preloadedState,
  )
  const context = {}
  return {
    html: renderToString(
      <Provider store={store}>
        <Router location={path} context={context}>
          <Layout>
            <Route exact path="/" component={Portfolio} />
            <Route path="/tasks" component={TaskApp} />
            <Route path="/blog" component={BlogApp} />
          </Layout>
        </Router>
      </Provider>
    ),
    state: JSON.stringify(store.getState())
  };
}
