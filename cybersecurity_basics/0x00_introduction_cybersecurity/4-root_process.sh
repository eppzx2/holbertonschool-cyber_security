#!/bin/bash
ps -u "$1" -o pid,user,vsz,rss,cmd | grep -vE '^[[:space:]]*PID| 0 +0 '
