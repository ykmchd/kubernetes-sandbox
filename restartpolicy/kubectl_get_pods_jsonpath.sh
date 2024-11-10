#!/bin/bash

kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.restartPolicy}{"\n"}{end}'
