#!/bin/bash
running = `pgrep -U root -x stock`
if [[ -n $runnning ]]; then
    pkill -U root -x stock
fi
