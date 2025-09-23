#!/bin/bash


DATE=$(date)


START_TIME=$(date +%s)

sleep 10 &

END_TIME=$(date +%s)

TOtal_Time=$(($END_TIME - $START_TIME))

echo "Script executed in: $TOtal_Time seconds"