#!/bin/bash
curl -i -X POST -H "Host: $1" "$2" "$3"
