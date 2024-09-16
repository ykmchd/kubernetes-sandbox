#!/bin/bash

kubectl run curl --image=curlimages/curl --n sample-ns-a -it --rm -- sh
