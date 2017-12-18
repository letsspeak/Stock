# Stock
[![Build Status](https://travis-ci.org/letsspeak/Stock.svg?branch=master)](https://travis-ci.org/letsspeak/Stock)

## Dependencies

- MySQL
- OpenSSL

## macOS

### Requirements

- Swift 3.0
- Xcode

### Build

1. `$ git clone https://github.com/letsspeak/Stock.git`
1. `$ cd Stock`
1. `$ swift build -Xlinker -L/usr/local/lib generate-xcodeproj`

### Develop & Debug with Xcode on macOS

1. Install dependencies
    1. `$ brew install mysql`
    1. `$ brew install vapor/tap/ctls` or `$ brew install vapor/tap/ctls`
1. `$ swift package -Xlinker -L/usr/local/lib generate-xcodeproj`
1. Open generated `Stock.xcodeproj`
1. Select Product -> Scheme -> Edit Scheme... on Xcode menu
1. Info tab with Run pane, Select Executable `Run` and check `Debug executable`
1. Select Product -> Run on Xcode menu

## Ubuntu 16.04

### Install Swift

1. `$ sudo apt-get update`
1. `$ sudo apt-get install clang libicu-dev libcurl4-openssl-dev libssl-dev`
1. `$ wget https://swift.org/builds/swift-4.0-release/ubuntu1604/swift-4.0-RELEASE/swift-4.0-RELEASE-ubuntu16.04.tar.gz`
1. `$ tar xzvf swift-4.0-RELEASE-ubuntu16.04.tar.gz`
1. `$ echo "export PATH=~/swift-4.0-RELEASE-ubuntu16.04/usr/bin:$PATH" >> ~/.bashrc`
1. `$ source ~/.bashrc`

### Install Dependencies

1. `$ sudo apt-get install uuid-dev libmysqlclient-dev`

### Build

1. `$ git clone https://github.com/letsspeak/Stock.git`
1. `$ cd Stock`
1. `$ swift build` or `$ swift build -c release`

