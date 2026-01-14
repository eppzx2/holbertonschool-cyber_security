#!/bin/bash
curl -X POST -i -H "Host: $1" -d "$3" "$2"
