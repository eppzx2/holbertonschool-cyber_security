#!/bin/bash
sudo nmap --open -sX -p 440-450 --packet-trace $1
