#!/bin/bash
set -e
oc -n rook-ceph exec -it $(oc -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') bash
