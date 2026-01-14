#!/bin/bash
curl -i -H "Host: $1" -d "$3" "$2"
