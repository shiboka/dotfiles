#!/bin/bash
LOGSDIR=~/.local/logs
PORTNUM=$(cat $LOGSDIR/port.log)
ITERS=$(cat $LOGSDIR/count.log)
echo -e "${COLOR_LIGHT_BLUE}Iterations: ${COLOR_WHITE}${ITERS}"
echo -e "${COLOR_LIGHT_BLUE}Forwarded Port: ${COLOR_WHITE}${PORTNUM}"
