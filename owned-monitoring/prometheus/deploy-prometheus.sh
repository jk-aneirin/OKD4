#!/bin/bash

set -o nounset
set -o errexit

oc new-project my-monitoring --display-name='my-monitoring'

# install prometheus operator
if ! oc get packagemanifest/prometheus -n openshift-marketplace &> /dev/null; then
    echo "There are no prometheus operator in OperatorHub,please deal with it"
    exit 1
else
	oc create -f prometheus-operator.yaml
fi

# NOTE:secret name must conform to the below specification,
# "alertnamager-<alertmanager-name>"
oc create secret generic alertmanager-alertmanager --from-file=alertmanager/alertmanager.yaml
# deploy alertmanager app
oc create -f alertmanager/alertmanager-cr.yaml

# deploy prometheus CR
oc create -f prometheus-cr.yaml

# deploy apache-exporter
oc create -f targets/apache-exporter/apache-exporter.yaml
