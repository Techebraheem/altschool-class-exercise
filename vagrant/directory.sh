#!/bin/bash

iteration=7
count=1

while [ "$count" -le "$iteration" ];
do
	echo"iteration ${count}"
	count=$((count + 1))	
done
