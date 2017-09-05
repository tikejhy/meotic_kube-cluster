#!/bin/bash

services="svc deploy ingress"
for type in $services; do
		kubectl get $type --all-namespaces | awk '{ print $1,$2}' | grep -v "NAMESPACE NAME" | while read namespace pod; do
		mkdir -p backup/${namespace}
		kubectl get $type/$pod -n $namespace -o yaml > backup/${namespace}/${type}_${pod}.yaml
	done
done
