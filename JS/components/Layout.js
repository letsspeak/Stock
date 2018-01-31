import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import Footer from './Footer'

class Layout extends Component {
  render() {
    let { children } = this.props;
    return (
      <div>
        <h1>Welcome to My Website!</h1>
        <ul>
          <li><Link to="/">Top</Link></li>
          <li><Link to="/tasks">Tasks</Link></li>
          <li><Link to="/blog">Blog</Link></li>
        </ul>
        <hr/>
        {children}
      </div>
    )
  }
}

export default Layout
