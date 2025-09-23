#!/bin/bash

echo "please enter the number:"
read NUMBER

if[ $(($NUMBER % 2)) -eq 0 ]; then
    echo "GIVEN number $NUMBER is EVEN"
else
    echo "GIVEN number $NUMBER is ODD"
fi