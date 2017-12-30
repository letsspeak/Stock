# Stock
[![Build Status](https://travis-ci.org/letsspeak/Stock.svg?branch=master)](https://travis-ci.org/letsspeak/Stock)

## Ubuntu 16.04

### Install Swift and Vapor

1. `$ curl -sL https://apt.vapor.sh | bash;`
1. `$ apt-get update && apt-get -y install swift vapor`

### Build

1. `$ git clone https://github.com/letsspeak/Stock.git`
1. `$ cd Stock`
1. `$ swift build` or `$ swift build -c release`

## Develop & Debug with Xcode on macOS

1. `$ brew install vapor/tap/ctls`
1. `$ git clone https://github.com/letsspeak/Stock.git`
1. `$ cd Stock`
1. `$ swift package generate-xcodeproj`
1. Open generated `Stock.xcodeproj`
1. Select Product -> Scheme -> Edit Scheme... on Xcode menu
1. Info tab with Run pane, Select Executable `Run` and check `Debug executable`
1. Options tab with Run pane, Check `Use custom working directory` and select `*path/to/Stock`
1. Select Product -> Run on Xcode menu

