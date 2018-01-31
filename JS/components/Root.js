import React from 'react'
import PropTypes from 'prop-types'
import { Provider } from 'react-redux'
import { BrowserRouter as Router, Route, browserHistory, IndexRoute } from 'react-router-dom'

import Layout from './Layout'
import Portfolio from './Portfolio'
import TaskApp from './TaskApp'
import BlogApp from './BlogApp'

const Root = ({ store }) => (
  <Provider store={store}>
    <Router history={browserHistory}>
      <Layout>
        <Route exact path="/" component={Portfolio} />
        <Route path="/tasks" component={TaskApp} />
        <Route path="/blog" component={BlogApp} />
      </Layout>
    </Router>
  </Provider>
)

Root.propTypes = {
  store: PropTypes.object.isRequired
}

export default Root

