#!/bin/bash
if curl -s localhost > /dev/null
then
  echo "$(date '+%Y-%m-%d %H:%M') Website is UP ✅"
else
  echo "$(date '+%Y-%m-%d %H:%M') Website is DOWN ❌"
fi
