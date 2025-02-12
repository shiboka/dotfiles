#!/bin/bash

LOGSDIR=~/.local/logs
LOGFILE=${LOGSDIR}/portfwd.log
count=0

mkdir -p $L0GSDIR

while true; do
  echo $count > ${LOGSDIR}/count.log
  timeout 2 natpmpc -a 1 0 udp 60 -g 10.2.0.1
  timeout 2 natpmpc -a 1 0 tcp 60 -g 10.2.0.1 | tail | sed -nE 's/.*Mapped public port ([0-9]+).*/\1/p' > ${LOGSDIR}/port.log
  count=$((count+1))
  sleep 30
done
