import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import Footer from './Footer'
import styles from '../styles/layout.css'

class Layout extends Component {
  render() {
    const { children } = this.props;

    return (
      <div className="page">
        <div className={styles.headerLine} />
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
