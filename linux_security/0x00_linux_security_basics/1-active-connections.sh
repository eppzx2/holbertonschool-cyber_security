#!/bin/bash
[[ $EUID -ne 0 ]] && exec sudo "$0" "$@"
ss -antp
