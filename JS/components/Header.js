import React, { Component } from 'react'
import { Link, NavLink } from 'react-router-dom'
import styles from '../styles/header.scss'

class Header extends Component {
  render() {

    return (
      <header className={styles.header}>
        <div className={styles.logo}>
          <Link to="/" className={styles.name}>Masatsugu Omiya</Link>
          <span className={styles.job}>Software Developer</span>
        </div>
        <nav className={styles.nav}>
          <ul>
            <li><NavLink exact to="/" activeClassName={styles.active}>Top</NavLink></li>
            <li><NavLink to="/blog" activeClassName={styles.active}>Blog</NavLink></li>
            <li><NavLink to="/tasks" activeClassName={styles.active}>Tasks</NavLink></li>
            <li className={styles.email}>
              <a href="mailto:letsinfinite@gmail.com">letsinfinite@gmail.com</a>
            </li>
          </ul>
        </nav>
      </header>
    )
  }
}

export default Header
