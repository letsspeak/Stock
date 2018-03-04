import React, { Component } from 'react'
import Header from './Header'
import Footer from './Footer'
import styles from '../styles/layout.scss'

class Layout extends Component {
  render() {
    const { children } = this.props;

    return (
      <div className={styles.page}>
        <div className={styles.headerLine} />
        <Header />
        {children}
        <Footer />
      </div>
    )
  }
}

export default Layout
