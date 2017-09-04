#!/bin/bash

# Test 2 Pr
#

services="svc deploy ingress"
for i in $services; do
	for j in $(kubectl get $i | awk '{ print $1 }' | grep -v "NAME"); do
		kubectl get $i/$j -o yaml > backup/$i_$j.yaml
	done
done
