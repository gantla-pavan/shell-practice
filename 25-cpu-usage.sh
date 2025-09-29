#!/bin/bash

DISK_USAGE=$(df -hT |grep -v Filesystem)

While IFS= read -r line
do
    echo "Line: $Line"

done<<< $DISK_USAGE