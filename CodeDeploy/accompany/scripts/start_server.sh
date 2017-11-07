#!/bin/bash
sudo LD_LIBRARY_PATH=/home/ubuntu/swift-4.0-RELEASE-ubuntu16.04/usr/lib/swift/linux bash -c '/home/stock/stock serve --workDir=/home/stock --env=production >> /var/log/stock/stock.log 2>&1 &'
