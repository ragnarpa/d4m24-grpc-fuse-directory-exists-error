#!/usr/bin/env bash

# Before running this script install/restart d4m 2.4.0.0 
# with "Use gRPC FUSE for file sharing" option turned on.

function run {
  echo $1
  kubectl delete pod directory-exists-error --ignore-not-found
  kubectl apply -f pod.yaml
  sleep 10
  ls /private/tmp/d4m24-grpc-fuse-directory-exists-error
  kubectl describe pod directory-exists-error | grep -A20 Events
}

run "Before deletion..."

rm -fr /private/tmp/d4m24-grpc-fuse-directory-exists-error

run "After deletion..."

