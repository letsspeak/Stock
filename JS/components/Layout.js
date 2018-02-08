import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import Footer from './Footer'
import styles from '../styles/layout.scss'

class Layout extends Component {
  render() {
    const { children } = this.props;

    return (
      <div className={styles.page}>
        <div className={styles.headerLine} />
        <header className={styles.header}>
          <div className={styles.logo}>
            <Link to="/" className={styles.name}>Masatsugu Omiya</Link>
            <span className={styles.job}>Software Developer</span>
          </div>
          <nav className={styles.nav}>
            <ul>
              <li><Link to="/">Top</Link></li>
              <li><Link to="/blog">Blog</Link></li>
              <li><Link to="/tasks">Tasks</Link></li>
              <li className={styles.email}>
                <a href="mailto:letsinfinite@gmail.com">letsinfinite@gmail.com</a>
              </li>
            </ul>
          </nav>
        </header>
        {children}
      </div>
    )
  }
}

export default Layout
