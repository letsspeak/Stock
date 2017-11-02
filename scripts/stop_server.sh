#!/bin/bash
running = `pgrep -U stock -x stock`
if [[ -n $runnning ]]; then
    pkill -U stock -x stock
fi
