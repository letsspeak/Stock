# Stock
[![Build Status](https://travis-ci.org/letsspeak/Stock.svg?branch=master)](https://travis-ci.org/letsspeak/Stock)

# Debug on Xcode

1. Install MySQL

`brew install mysql`

2. Generate xcodeproj via Swift Package Manager

```
cd path/to/local-repos
make xcode
```

3. Open `Stock.xcodeproj`

4. Select Product -> Scheme -> Edit Scheme... on Xcode menu

5. Info tab with Run pane, Select Executable `Stock` and check `Debug executable`

6. Select Product -> Run on Xcode menu
