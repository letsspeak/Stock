import React from 'react'
import styles from '../styles/portfolio.scss'

const Portfolio = () => (
  <main className={styles.main}>

    <div className={styles.profile}>
      <img className={styles.portrait} src="./images/job_programmer.png" />
      <div className={styles.description}>
        <h2>Masatsugu Omiya</h2>
        <p>東京でフリーランスプログラマーをしています。</p>
        <p>お仕事のご依頼、ご相談などありましたら、お気軽にメールもしくはTwitterへご連絡ください。</p>
        <span><a href="mailto:letsinfinite@gmail.com">letsinfinite@gmail.com</a></span>
        <span className={styles.twitter}><a href="https://twitter.com/letsspeak" target="_blank">@letsspeak</a></span>
      </div>
    </div>

    <h1 className={styles.title}>Products</h1>
    <div className={styles.products}>
      <div className={styles.product}>
        <h2 className={styles.name}>AirQR</h2>
        <span>開発中</span>
        <p>QRコードでファイルを簡単にやりとりするアプリ</p>
        <h3>Features</h3>
        <ul>
          <li>iOS</li>
          <li>Android</li>
          <li>Ruby on Rails</li>
          <li>ReactJS</li>
          <li>Amazon S3</li>
        </ul>
      </div>
      <div className={styles.product}>
        <h2 className={styles.name}>Stock</h2>
        <p>当サイトのタスク管理、ブログシステム</p>
        <h3>Features</h3>
        <ul>
          <li>Vapor (Server Side Swift)</li>
          <li>ReactJS</li>
          <li>SASS & CSS Module</li>
          <li>Github - CircleCI - Amazon ECS Integration</li>
        </ul>
      </div>
      <div className={styles.product}>
        <h2 className={styles.name}>GOスキャナー</h2>
        <p>ポケモンGO用の個体値スキャナー</p>
        <h3>Features</h3>
        <ul>
          <li>iOS/Swift</li>
          <li>TesseractOCR</li>
          <li>Amazon S3</li>
        </ul>
      </div>
      <div className={styles.product}>
        <h2 className={styles.name}>ff14memory</h2>
        <p>オンラインゲームのスクリーンショット共有サイト</p>
        <h3>Features</h3>
        <ul>
          <li>Laravel</li>
          <li>Amazon S3</li>
          <li>trimming_upload.js</li>
        </ul>
      </div>
    </div>
    <div><span>// TODO : 各プロダクトのカードイメージ挿入</span></div>

    <h1>Skill set</h1>
    <div className={styles.skillsets}>
      <div className={styles.language}>
        <h2>Language</h2>
        <ul>
          <li>Swift</li>
          <li>Java</li>
          <li>JavaScript</li>
          <li>Ruby</li>
          <li>php</li>
          <li>Shell Script</li>
        </ul>
      </div>
      <div className={styles.technology}>
        <h2>Technology</h2>
        <ul>
          <li>Front-end</li>
          <li>Back-end</li>
          <li>HTML</li>
          <li>SASS</li>
          <li>ReactJS</li>
          <li>MySQL</li>
          <li>AWS</li>
          <li>iOS</li>
          <li>Android</li>
          <li>UI/UX Design</li>
          <li>Spring</li>
          <li>Ruby on Rails</li>
          <li>Laravel</li>
        </ul>
      </div>
    </div>
    <div><span>// TODO : どのくらい得意かをゲージで表現する</span></div>

    <h1>Social</h1>
    <div className={styles.social}>
      <div className={styles.socials}>
        <span><a href="https://github.com/letsspeak">GitHub</a></span>
        <span><a href="https://twitter.com/letsspeak">Twitter</a></span>
        <span><a href="https://qiita.com/letsspeak">Qiita</a></span>
      </div>
      <span><a href="mailto:letsinfinite@gmail.com">letsinfinite@gmail.com</a></span>
    </div>
    <div><span>// TODO : アイコンをつける</span></div>

    <h1>Career</h1>
    <div>
      <h2>小学校</h2>
      <ul>
        <li>父が持っていたPC-8801mkII で BASIC と出会う</li>
        <li>雑誌の付録についてきた Visual Basic の体験版でプログラミングにはまる</li>
        <li>HTMLでホームページを公開</li>
        <li>C言語の初歩を独学</li>
      </ul>
      <h2>中学校〜大学</h2>
      <ul>
        <li>Visual C++ 6.0 を購入し、書籍やインターネットを利用してプログラミングを本格的に独習</li>
        <li>スーパープログラマーへの道を愛読、yaneSDKをコンパイルしてDirectXプログラミングについて学ぶ</li>
        <li>Hot Soup Processor や ygs2k でミニゲームを制作</li>
        <li>QMAにはまり、特訓用のソフトウェアを公開する</li>
      </ul>
      <h2>プログラマー</h2>
      <ul>
        <li>2012年1月〜札幌の会社でiOSのアプリ製作チームに加わり約2年半間お世話になる</li>
        <li>2014年6月〜一念発起して東京へ移住。より良い居場所を探して会社を転々とする</li>
        <li>2015年10月〜秋葉原の会社に2年弱お世話になる</li>
        <li>2017年10月〜フリーランスプログラマーとして活動を始める</li>
      </ul>
    </div>
  </main>
)

export default Portfolio
