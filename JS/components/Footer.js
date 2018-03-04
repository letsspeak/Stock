import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import styles from '../styles/footer.scss'

class Footer extends Component {
  render() {

    return (
      <footer className={styles.footer}>
        <div className={styles.profile}>
          <h2 className={styles.name}>Masatsugu Omiya</h2>
          <span><a href="mailto:letsinfinite@gmail.com">letsinfinite@gmail.com</a></span>
          <p>東京でフリーランスプログラマーをしています。お仕事のご依頼等はお気軽にご連絡ください。</p>
        </div>
        <div className={styles.navigations}>
          <nav>
            <h3>Menu</h3>
            <ul>
              <li><Link to="/">Top</Link></li>
              <li><Link to="/blog">Blog</Link></li>
              <li><Link to="/tasks">Tasks</Link></li>
            </ul>
          </nav>
          <nav>
            <h3>Contact</h3>
            <ul>
              <li><a href="mailto:letsinfinite@gmail.com">letsinfinite@gmail.com</a></li>
              <li><a href="https://twitter.com/letsspeak">@letsspeak</a></li>
            </ul>
          </nav>
          <nav>
            <h3>Social</h3>
            <ul>
              <li><a href="https://github.com/letsspeak">GitHub</a></li>
              <li><a href="https://twitter.com/letsspeak">Twitter</a></li>
              <li><a href="https://qiita.com/letsspeak">Qiita</a></li>
            </ul>
          </nav>
        </div>
        <div className={styles.copyright}>
          <span>Copyright Masatsugu Omiya 2018 © <a href="https://github.com/letsspeak/Stock">More information</a> — made with <a href="https://github.com/vapor/vapor">Vapor</a> / Stock ver. XXX</span>
        </div>
      </footer>
    )
  }
}

export default Footer
