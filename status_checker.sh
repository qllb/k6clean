#!/bin/bash

links=("$@")

for link in "${links[@]}"; do
  res=$(curl -s https://www.isitdownrightnow.com/check.php\?domain\=${link} | grep 'not available' )
  if [ -n "$res" ]; then
    echo "$link is down"
  else
    echo "$link is still up"
  fi
  sleep 3
done
