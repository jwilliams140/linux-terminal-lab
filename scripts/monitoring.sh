#!/bin/bash

output="network_status_$(date +%Y%m%d_%H%M%S).log"

servers=("google.com" "github.com" "stackoverflow.com")

echo "Network Report - $(date)" > $output

for server in "${servers[@]}"
do
   if ping -c 1 $server > /dev/null 2>&1
   then
      echo "$server is UP" >> $output
   else
      echo "$server is DOWN" >> $output
fi
done

echo "Results saved to $output"
