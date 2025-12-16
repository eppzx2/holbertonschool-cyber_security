#!/bin/bash
tr -dc '[:alnum:]' </dev/urandom | head -s "$1"
