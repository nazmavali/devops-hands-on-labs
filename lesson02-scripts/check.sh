#!/bin/bash
if curl -s localhost > /dev/null
then
  echo "Website is UP ✅"
else
  echo "Website is DOWN ❌"
fi
