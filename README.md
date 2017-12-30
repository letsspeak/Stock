# Stock
[![Build Status](https://travis-ci.org/letsspeak/Stock.svg?branch=master)](https://travis-ci.org/letsspeak/Stock)

## Docker

### Build

1. `git clone https://github.com/letsspeak/Stock.git && cd Stock`
1. `docker build ./Deployment/` or `docker pull letsspeak/stock-ci:latest`
1. `docker run -d -it -p 8080:8080 letsspeak/stock-ci:latest bash`
1. `export CID=[CONTAINER_ID]`
1. `docker cp . $CID:/var/stock`
1. `docker exec $CID bash -c 'OPTIMIZE=1 make deps all'`

### Start Server

1. `docker exec $CID ./.build/x86_64-unknown-linux/release/stock serve`

### Stop Server

1. `docker exec $CID pkill -U root -x stock`

## Ubuntu 16.04

### Install Dependencies

#### Swift and Vapor

1. `$ curl -sL https://apt.vapor.sh | bash`
1. `$ sudo apt-get update`
1. `$ sudo apt-get -y install swift vapor`

#### nodejs

1. `$ sudo apt-get install -y nodejs npm`
1. `$ curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -`
1. `$ sudo apt-get install -y nodejs`

#### yarn

1. `curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`
1. `echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
1. `sudo apt-get update && sudo apt-get -y install yarn`

### Build

1. `$ git clone https://github.com/letsspeak/Stock.git && cd Stock`
1. `$ make deps all`
1. `$ swift build` or `$ swift build -c release`

## Debug on macOS

### Install Dependencies

#### Vapor

1. `$ brew install vapor/tap/ctls`

#### yarn

1. `$ brew install yarn`

### Develop & Debug with Xcode on macOS

1. `$ git clone https://github.com/letsspeak/Stock.git && cd Stock`
1. `$ swift package generate-xcodeproj`
1. Open generated `Stock.xcodeproj`
1. Select Product -> Scheme -> Edit Scheme... on Xcode menu
1. Info tab with Run pane, Select Executable `Run` and check `Debug executable`
1. Options tab with Run pane, Check `Use custom working directory` and select `*path/to/Stock`
1. Select Product -> Run on Xcode menu

